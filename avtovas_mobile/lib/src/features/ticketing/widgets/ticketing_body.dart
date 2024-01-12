import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/passenger_selector_sheet.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_shimmer_content.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/one_c_entities/seats_scheme.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingBody extends StatefulWidget {
  final SingleTrip trip;
  final TicketingCubit cubit;

  const TicketingBody({
    required this.trip,
    required this.cubit,
    super.key,
  });

  @override
  State<TicketingBody> createState() => _TicketingBodyState();
}

class _TicketingBodyState extends State<TicketingBody> {
  late final TextEditingController _emailController;
  late List<List<GlobalKey<FormState>>> _validateKeys;
  late final GlobalKey<FormState> _emailSenderValidateKey;

  @override
  void initState() {
    super.initState();

    widget.cubit.setSingleTrip(widget.trip);

    _emailController = TextEditingController();
    _emailSenderValidateKey = GlobalKey<FormState>();
    _validateKeys = [];
    _fillValidateKeys(passengerIndex: 0);
  }

  void _fillValidateKeys({required int passengerIndex}) {
    setState(
      () => _validateKeys
        ..insert(passengerIndex, [
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
        ]),
    );
  }

  Future<void> _showErrorAlert({
    required BuildContext context,
    required TicketingState state,
    required VoidCallback onClose,
  }) async {
    await SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AvtovasAlertDialog(
            title: context.locale.errorCode,
            withCancel: false,
            shouldCloseOnOkTap: false,
            widget: Text(state.errorMessage),
            okayCallback: onClose,
          ),
        );
      },
    );
  }

  void _removeValidateKeys({required int passengerIndex}) {
    setState(() => _validateKeys.removeAt(passengerIndex));
  }

  bool _isValid({
    required ValueSetter<int> onGenderStatusChanged,
    required List<Passenger> passengers,
    required List<bool> genderErrors,
  }) {
    final expandedValidateKeys = _validateKeys.expand((keys) => keys);

    final validateValues = <bool>[];

    for (final key in expandedValidateKeys) {
      validateValues.add(key.currentState!.validate());
    }

    for (var i = 0; i < passengers.length; i++) {
      if (passengers[i].gender.isEmpty) onGenderStatusChanged(i);
    }

    final isEmailNotEmpty = _emailSenderValidateKey.currentState!.validate();

    return !validateValues.contains(false) &&
        !genderErrors.contains(true) &&
        isEmailNotEmpty;
  }

  Future<void> _showLoadingIndicator(BuildContext context) async {
    SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const CupertinoActivityIndicator(
            color: Color(0xFF000000),
          ),
        );
      },
    );
  }

  bool _loadingListenWhen(TicketingState prev, TicketingState current) {
    return prev.isLoading != current.isLoading;
  }

  void _loadingListener(BuildContext context, TicketingState state) {
    if (state.isLoading) {
      _showLoadingIndicator(context);
    }

    if (state.isErrorRead) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  bool _alertListenWhen(TicketingState prev, TicketingState current) {
    return !prev.shouldShowErrorAlert && current.shouldShowErrorAlert;
  }

  void _alertListener(BuildContext context, TicketingState state) {
    if (state.shouldShowErrorAlert) {
      _showErrorAlert(
        context: context,
        state: state,
        onClose: widget.cubit.closeErrorAlert,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    for (final keysList in _validateKeys) {
      keysList.clear();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketingCubit, TicketingState>(
      bloc: widget.cubit,
      listener: _alertListener,
      listenWhen: _alertListenWhen,
      builder: (context, state) {
        if (state.saleSession == null || state.occupiedSeat == null) {
          return const TicketingShimmerContent();
        }

        final departureDate =
            state.saleSession!.trip.departureTime.formatDay(context);
        final departureTime =
            state.saleSession!.trip.departureTime.formatTime();
        final finalPrice = widget.cubit.finalPriceByRate(
          state.rates,
          state.saleSession!.trip.fares,
        );

        return BlocListener<TicketingCubit, TicketingState>(
          listener: _loadingListener,
          listenWhen: _loadingListenWhen,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.large),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TicketingHeader(
                    departurePlace: state.saleSession!.departure.name,
                    arrivalPlace: state.saleSession!.destination.name,
                    tripDateTime: '$departureDate ${context.locale.inside} '
                        '$departureTime',
                    tripPrice: context.locale.price(finalPrice),
                  ),
                  for (var index = 0; index < state.passengers.length; index++)
                    _PassengerCollapsedContainer(
                      cubit: widget.cubit,
                      validateKeys: _validateKeys.elementAtOrNull(index),
                      onRemoveTap: () {
                        _removeValidateKeys(passengerIndex: index);
                        widget.cubit.removePassenger(passengerIndex: index);
                      },
                      passengerIndex: index,
                      ticketPrice: widget.cubit.priceByRate(
                        state.rates[index],
                        state.saleSession!.trip.fares,
                      ),
                      seatsScheme: state.saleSession!.trip.bus.seatsScheme,
                      occupiedSeat: state.occupiedSeat,
                      singleTripFares: state.trip!.fares,
                    ),
                  AvtovasButton.icon(
                    padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                    borderColor: context.theme.mainAppColor,
                    buttonColor: context.theme.transparent,
                    buttonText: context.locale.addPassenger,
                    textStyle: context.themeData.textTheme.titleLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                    ),
                    backgroundOpacity: 0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    svgPath: AppAssets.addIcon,
                    onTap: () {
                      _fillValidateKeys(
                        passengerIndex: state.passengers.length - 1,
                      );
                      widget.cubit.addNewPassenger();
                    },
                  ),
                  EmailSender(
                    controller: _emailController,
                    formKey: _emailSenderValidateKey,
                    onChanged: widget.cubit.changeUsedEmail,
                    onSavedEmailChanged: (value) {
                      widget.cubit
                          .changeSavedEmailUsability(useSavedEmail: value);
                      if (value) {
                        _emailSenderValidateKey.currentState!.reset();
                        _emailController.text = state.availableEmails!.last;
                        widget.cubit
                            .changeUsedEmail(state.availableEmails!.last);
                      } else {
                        _emailController.text = '';
                        widget.cubit.changeUsedEmail('');
                      }
                    },
                    savedEmail: state.availableEmails?.first,
                    isSavedEmailUsed: state.useSavedEmail,
                  ),
                  AvtovasButton.text(
                    padding: const EdgeInsets.all(AppDimensions.large),
                    buttonText: context.locale.buyFor(
                      context.locale.price(finalPrice),
                    ),
                    textStyle: context.themeData.textTheme.titleLarge?.copyWith(
                      color: context.theme.whiteTextColor,
                      fontSize: AppFonts.sizeHeadlineMedium,
                    ),
                    onTap: () {
                      if (_isValid(
                        onGenderStatusChanged: (index) =>
                            widget.cubit.changeGenderErrorStatus(
                          index: index,
                          status: true,
                        ),
                        passengers: state.passengers,
                        genderErrors: state.genderErrors,
                      )) {
                        widget.cubit.buyTicket();
                      }
                    },
                  ),
                ].insertBetween(
                  const SizedBox(height: AppDimensions.large),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

final class _PassengerCollapsedContainer extends StatefulWidget {
  final TicketingCubit cubit;
  final VoidCallback onRemoveTap;
  final int passengerIndex;
  final String ticketPrice;
  final List<GlobalKey<FormState>>? validateKeys;
  final List<SeatsScheme>? seatsScheme;
  final List<OccupiedSeat>? occupiedSeat;
  final List<SingleTripFares> singleTripFares;

  const _PassengerCollapsedContainer({
    required this.cubit,
    required this.onRemoveTap,
    required this.passengerIndex,
    required this.ticketPrice,
    required this.validateKeys,
    required this.seatsScheme,
    required this.occupiedSeat,
    required this.singleTripFares,
  });

  @override
  State<_PassengerCollapsedContainer> createState() =>
      _PassengerCollapsedContainerState();
}

class _PassengerCollapsedContainerState
    extends State<_PassengerCollapsedContainer> {
  final reservedSeats = []; // List of reserved seats
  final availableSeats = <String>[]; // List of all available seats
  final availableFares = <SingleTripFares>[]; // List of all available fares

  @override
  void initState() {
    super.initState();
    _initializeSeats();
    _initializeFares();
  }

  Future<void> _showSelector(
    BuildContext context,
    List<Passenger>? passengers,
  ) async {
    await SupportMethods.showAvtovasBottomSheet(
      sheetTitle: context.locale.passengers,
      context: context,
      child: PassengerSelectorSheet(
        existentPassengers: passengers,
        onPassengerChanged: (passenger) => widget.cubit.changeIndexedPassenger(
          passengerIndex: widget.passengerIndex,
          existentPassenger: passenger,
        ),
      ),
    );

    for (final key in widget.validateKeys ?? <GlobalKey<FormState>>[]) {
      key.currentState?.reset();
    }
  }

  void _initializeSeats() {
    reservedSeats.addAll(
      widget.occupiedSeat?.map((seat) => seat.number) ?? [],
    );

    final filteredSeats =
        widget.seatsScheme?.where((seat) => seat.seatNum != '0').toList() ?? [];

    availableSeats
      ..addAll(filteredSeats.map((seat) => seat.seatNum))
      ..removeWhere(reservedSeats.contains);
  }

  void _initializeFares() {
    final filteredFares =
        widget.singleTripFares.where((fare) => fare.cost != '0').toList();

    availableFares.addAll(filteredFares.map((fare) => fare));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketingCubit, TicketingState>(
      bloc: widget.cubit,
      builder: (context, state) {
        final passenger = state.passengers[widget.passengerIndex];
        final rate = state.rates[widget.passengerIndex];

        return PassengerCollapsedContainer(
          formKeys: widget.validateKeys,
          isGenderError: state.genderErrors[widget.passengerIndex],
          onGenderChanged: () => widget.cubit.changeGenderErrorStatus(
            index: widget.passengerIndex,
            status: false,
          ),
          availableSeats: availableSeats,
          onSeatChanged: (value) => widget.cubit.changePassengerSeatNumber(
            passengerIndex: widget.passengerIndex,
            seat: value,
          ),
          passengerNumber: widget.passengerIndex + 1,
          withRemoveButton: widget.passengerIndex != 0,
          removePassenger: widget.onRemoveTap,
          ticketPrice: context.locale.price(widget.ticketPrice),
          onSurnameVisibleChanged: (value) =>
              widget.cubit.changeSurnameVisibility(
            passengerIndex: widget.passengerIndex,
            withoutSurname: value,
          ),
          noSurname: state.surnameStatuses[widget.passengerIndex],
          onPassengerChanged: ({
            String? firstName,
            String? lastName,
            String? surname,
            String? gender,
            DateTime? birthdayDate,
            String? citizenship,
            String? documentType,
            String? documentData,
            String? rate,
          }) {
            print(firstName);
            widget.cubit.changeIndexedPassenger(
              passengerIndex: widget.passengerIndex,
              firstName: firstName,
              lastName: lastName,
              surname: surname,
              gender: gender,
              birthdayDate: birthdayDate,
              citizenship: citizenship,
              documentType: documentType,
              documentData: documentData,
              rate: rate,
            );
          },
          firstNameValue: passenger.firstName,
          lastNameValue: passenger.lastName,
          surnameValue: passenger.surname,
          genderValue: passenger.gender,
          birthdayDateValue: passenger.birthdayDate,
          citizenshipValue: passenger.citizenship,
          documentTypeValue: passenger.documentType,
          documentDataValue: passenger.documentData,
          rateValue: rate,
          seatValue: state.seats[widget.passengerIndex],
          onSelectPassengerTap: () {
            _showSelector(
              context,
              state.existentPassengers,
            );
            widget.cubit.changeGenderErrorStatus(
              index: widget.passengerIndex,
              status: false,
            );
          },
          singleTripFares: availableFares,
        );
      },
    );
  }
}
