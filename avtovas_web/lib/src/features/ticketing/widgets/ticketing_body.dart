import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_web/src/features/ticketing/widgets/passenger_selector_sheet.dart';
import 'package:avtovas_web/src/features/ticketing/widgets/ticketing_shimmer_content.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_passenger.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/one_c_entities/seats_scheme.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingBody extends StatefulWidget {
  final SingleTrip? trip;
  final TicketingCubit cubit;
  final bool smartLayout;
  final String dbName;

  final String tripId;
  final String departure;
  final String destination;

  const TicketingBody({
    required this.trip,
    required this.cubit,
    required this.smartLayout,
    required this.tripId,
    required this.departure,
    required this.destination,
    required this.dbName,
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

    if (widget.trip == null) {
      widget.cubit.initializationStatusSubscribe(
        tripId: widget.tripId,
        departure: widget.departure,
        destination: widget.destination,
        dbName: widget.dbName,
      );
    } else {
      widget.cubit.setSingleTrip(widget.trip!);
    }

    _emailController = TextEditingController();
    _emailSenderValidateKey = GlobalKey<FormState>();
    _validateKeys = [];
    _fillValidateKeys(passengerIndex: 0);

    Future.delayed(
      Duration.zero,
          () => _emailController.text = widget.cubit.state.usedEmail,
    );
  }

  void _fillValidateKeys({required int passengerIndex}) {
    setState(
          () =>
      _validateKeys
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

  Future<void> _showSaleSessionLoadingErrorAlert({
    required BuildContext context,
    required TicketingState state,
    required VoidCallback onClose,
  }) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AvtovasAlertDialog(
            withCancel: false,
            widget: Text(state.errorMessage),
          ),
        );
      },
    ).whenComplete(onClose);
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
    var genderNotHasError = true;

    final validateValues = <bool>[];

    for (final key in expandedValidateKeys) {
      validateValues.add(key.currentState!.validate());
    }

    for (var i = 0; i < passengers.length; i++) {
      if (passengers[i].gender.isEmpty) {
        onGenderStatusChanged(i);
        genderNotHasError = false;
      }
    }

    final isEmailNotEmpty = _emailSenderValidateKey.currentState!.validate();

    return !validateValues.contains(false) &&
        genderNotHasError &&
        isEmailNotEmpty;
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

  bool _saleSessionAlertListenWhen(TicketingState prev,
      TicketingState current,) {
    return !prev.shouldShowSaleSessionError &&
        current.shouldShowSaleSessionError;
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
    return MultiBlocListener(
      listeners: [
        BlocListener<TicketingCubit, TicketingState>(
          listener: _alertListener,
          listenWhen: _alertListenWhen,
        ),
        BlocListener<TicketingCubit, TicketingState>(
          listener: (context, state) =>
              _showSaleSessionLoadingErrorAlert(
                context: context,
                state: state,
                onClose: widget.cubit.popFromPage,
              ),
          listenWhen: _saleSessionAlertListenWhen,
        ),
      ],
      child: BlocBuilder<TicketingCubit, TicketingState>(
        bloc: widget.cubit,
        builder: (context, state) {
          if (state.shouldShowEmptyTripMessage) {
            return Column(
              children: [
                SizedBox(height: MediaQuery
                    .sizeOf(context)
                    .height * 0.3),
                Center(
                  child: Text(
                    'Маршрут не найден',
                    style: context.themeData.textTheme.bodyLarge?.copyWith(
                      fontSize: WebFonts.sizeDisplayMedium,
                      color: context.theme.mainAppColor,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .sizeOf(context)
                    .height * 0.3),
              ],
            );
          }

          if (state.saleSession == null || state.occupiedSeat == null) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.large,
                vertical: AppDimensions.large,
              ),
              child: TicketingShimmerContent(),
            );
          }

          final departureDate =
          state.saleSession!.trip.departureTime.formatDay(context);
          final departureTime =
          state.saleSession!.trip.departureTime.formatTime();
          final finalPrice = widget.cubit.finalPriceByRate(
            state.rates,
            state.saleSession!.trip.fares,
          );

          final bottomContainer = [
            EmailSender(
              controller: _emailController,
              formKey: _emailSenderValidateKey,
              onChanged: widget.cubit.changeUsedEmail,
              backgroundColor: widget.smartLayout
                  ? null
                  : context.theme.containerBackgroundColor,
              onSavedEmailChanged: (value) {
                widget.cubit.changeSavedEmailUsability(useSavedEmail: value);
                if (value) {
                  _emailSenderValidateKey.currentState?.reset();
                  _emailController.text = state.availableEmails!.first;
                  widget.cubit.changeUsedEmail(state.availableEmails!.first);
                } else {
                  _emailController.text = '';
                  widget.cubit.changeUsedEmail('');
                }
              },
              savedEmail: state.availableEmails?.first,
              isSavedEmailUsed: state.useSavedEmail,
            ),
            if (!widget.smartLayout)
              const SizedBox(height: AppDimensions.medium),
            AvtovasButton.text(
              padding: const EdgeInsets.all(AppDimensions.large),
              buttonText: context.locale.buyFor(
                context.locale.price(finalPrice),
              ),
              textStyle: context.themeData.textTheme.titleLarge?.copyWith(
                color: context.theme.whiteTextColor,
                fontSize: WebFonts.sizeHeadlineMedium,
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
                  widget.cubit.checkAuthorizationStatus();
                }
              },
            ),
          ];

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: AppDimensions.mediumLarge),
                    Row(
                      children: [
                        TicketingHeader(
                          departurePlace: state.saleSession!.departure.name,
                          arrivalPlace: state.saleSession!.destination.name,
                          tripDateTime:
                          '$departureDate ${context.locale.inside} '
                              '$departureTime',
                          tripPrice: context.locale.price(finalPrice),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.mediumLarge),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              for (var index = 0;
                              index < state.passengers.length;
                              index++)
                                _PassengerAdaptiveContainer(
                                  smartLayout: widget.smartLayout,
                                  cubit: widget.cubit,
                                  rate: state.rates[index],
                                  validateKeys:
                                  _validateKeys.elementAtOrNull(index),
                                  onRemoveTap: () {
                                    _removeValidateKeys(passengerIndex: index);
                                    widget.cubit
                                        .removePassenger(passengerIndex: index);
                                  },
                                  passengerIndex: index,
                                  ticketPrice: widget.cubit.priceByRate(
                                    state.rates[index],
                                    state.saleSession!.trip.fares,
                                  ),
                                  seatsScheme:
                                  state.saleSession!.trip.bus.seatsScheme,
                                  occupiedSeat: state.occupiedSeat,
                                  singleTripFares: state.trip!.fares,
                                ),
                              AvtovasButton.icon(
                                padding: const EdgeInsets.all(
                                  AppDimensions.mediumLarge,
                                ),
                                borderColor: context.theme.mainAppColor,
                                buttonColor: context.theme.transparent,
                                buttonText: context.locale.addPassenger,
                                textStyle: context
                                    .themeData.textTheme.titleLarge
                                    ?.copyWith(
                                  color: context.theme.primaryTextColor,
                                ),
                                backgroundOpacity: 0,
                                mainAxisAlignment: MainAxisAlignment.center,
                                svgPath: WebAssets.roadIcon,
                                onTap: () {
                                  _fillValidateKeys(
                                    passengerIndex: state.passengers.length - 1,
                                  );
                                  widget.cubit.addNewPassenger();
                                },
                              ),
                              if (widget.smartLayout)
                                Column(children: bottomContainer),
                            ].insertBetween(
                              const SizedBox(height: AppDimensions.large),
                            ),
                          ),
                        ),
                        if (!widget.smartLayout)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: AppDimensions.large,
                              ),
                              child: Column(children: bottomContainer),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.large),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

final class _PassengerAdaptiveContainer extends StatefulWidget {
  final bool smartLayout;
  final TicketingCubit cubit;
  final VoidCallback onRemoveTap;
  final int passengerIndex;
  final String ticketPrice;
  final List<GlobalKey<FormState>>? validateKeys;
  final List<SeatsScheme>? seatsScheme;
  final List<OccupiedSeat>? occupiedSeat;
  final List<SingleTripFares> singleTripFares;
  final String rate;

  const _PassengerAdaptiveContainer({
    required this.smartLayout,
    required this.cubit,
    required this.onRemoveTap,
    required this.passengerIndex,
    required this.ticketPrice,
    required this.validateKeys,
    required this.seatsScheme,
    required this.occupiedSeat,
    required this.singleTripFares,
    required this.rate,
  });

  @override
  State<_PassengerAdaptiveContainer> createState() =>
      _PassengerAdaptiveContainerState();
}

class _PassengerAdaptiveContainerState
    extends State<_PassengerAdaptiveContainer> {
  final _reservedSeats = <String>[]; // List of reserved seats
  final _availableSeats = <String>[]; // List of all available seats
  final _availableFares = <SingleTripFares>[]; // List of all available fares

  @override
  void initState() {
    super.initState();
    _initializeSeats();
    _initializeFares();
  }

  Future<void> _showSelector(BuildContext context,
      List<Passenger>? passengers,) async {
    for (final key in widget.validateKeys ?? <GlobalKey<FormState>>[]) {
      key.currentState?.reset();
    }

    await SupportMethods.showAvtovasBottomSheet(
      sheetTitle: 'Пассажиры',
      context: context,
      child: PassengerSelectorSheet(
        existentPassengers: passengers,
        onPassengerChanged: (passenger) =>
            widget.cubit.changeIndexedPassenger(
              passengerIndex: widget.passengerIndex,
              existentPassenger: passenger,
            ),
      ),
    );
  }

  void _initializeSeats() {
    _reservedSeats.addAll(
      widget.occupiedSeat?.map((seat) => seat.number) ?? [],
    );

    final filteredSeats =
        widget.seatsScheme?.where((seat) => seat.seatNum != '0').toList() ?? [];

    _availableSeats
      ..addAll(filteredSeats.map((seat) => seat.seatNum))
      ..removeWhere(_reservedSeats.contains);
  }

  void _initializeFares() {
    final filteredFares =
    widget.singleTripFares.where((fare) => fare.cost != '0').toList();

    _availableFares.addAll(filteredFares);
  }

  @override
  void didUpdateWidget(covariant _PassengerAdaptiveContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.smartLayout != widget.smartLayout) {
      Future.delayed(Duration.zero, () => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketingCubit, TicketingState>(
      bloc: widget.cubit,
      builder: (context, state) {
        final passenger = state.passengers[widget.passengerIndex];

        return KeyedSubtree(
          child: widget.smartLayout
              ? PassengerCollapsedContainer(
            formKeys: widget.validateKeys,
            isGenderError: state.genderErrors[widget.passengerIndex],
            onGenderChanged: () =>
                widget.cubit.changeGenderErrorStatus(
                  index: widget.passengerIndex,
                  status: false,
                ),
            availableSeats: _availableSeats,
            onSeatChanged: (value) =>
                widget.cubit.changePassengerSeatNumber(
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
            rateValue: widget.rate,
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
            singleTripFares: _availableFares,
          )
              : PassengerExpandedContainer(
            formKeys: widget.validateKeys,
            isGenderError: state.genderErrors[widget.passengerIndex],
            onGenderChanged: () =>
                widget.cubit.changeGenderErrorStatus(
                  index: widget.passengerIndex,
                  status: false,
                ),
            availableSeats: _availableSeats,
            onSeatChanged: (value) =>
                widget.cubit.changePassengerSeatNumber(
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
            rateValue: widget.rate,
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
            singleTripFares: _availableFares,
          ),
        );
      },
    );
  }
}
