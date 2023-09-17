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

  final reservedSeats = []; // List of reserved seats
  final availableSeats = []; // List of all seats

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
    return BlocBuilder<TicketingCubit, TicketingState>(
      bloc: widget.cubit,
      builder: (context, state) {
        final saleSession = state.saleSession;
        final occupiedSeat = state.occupiedSeat;

        if (saleSession == null || occupiedSeat == null) {
          return const TicketingShimmerContent();
        }

        final departureDate = saleSession.trip.departureTime.formatDay(context);
        final departureTime = saleSession.trip.departureTime.formatTime();
        final finalPrice = widget.cubit.finalPriceByRate(
          state.passengers.map((pass) => pass.rate).toList(),
          saleSession.trip.fares,
        );

        return Padding(
          padding: const EdgeInsets.all(AppDimensions.large),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TicketingHeader(
                  departurePlace: saleSession.departure.name,
                  arrivalPlace: saleSession.destination.name,
                  tripDateTime:
                      '$departureDate ${context.locale.inside} $departureTime',
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
                      state.passengers[index].rate,
                      saleSession.trip.fares,
                    ),
                    seatsScheme: saleSession.trip.bus.seatsScheme,
                    occupiedSeat: occupiedSeat,
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
                      widget.cubit.changeUsedEmail(state.availableEmails!.last);
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
                      widget.cubit.buyTicket(context);
                    }
                  },
                ),
              ].insertBetween(
                const SizedBox(height: AppDimensions.large),
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

  const _PassengerCollapsedContainer({
    required this.cubit,
    required this.onRemoveTap,
    required this.passengerIndex,
    required this.ticketPrice,
    required this.validateKeys,
    required this.seatsScheme,
    required this.occupiedSeat,
  });

  @override
  State<_PassengerCollapsedContainer> createState() =>
      _PassengerCollapsedContainerState();
}

class _PassengerCollapsedContainerState
    extends State<_PassengerCollapsedContainer> {
  final reservedSeats = []; // List of reserved seats
  final availableSeats = <String>[]; // List of all available seats

  @override
  void initState() {
    super.initState();
    initializeSeats();
  }

  Future<void> _showSelector(
    BuildContext context,
    List<Passenger>? passengers,
  ) async {
    await SupportMethods.showAvtovasBottomSheet(
      sheetTitle: 'Пассажиры',
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

  void initializeSeats() {
    // Filling reservedSeats list with values from occupiedSeat
    reservedSeats.addAll(
      widget.occupiedSeat?.map((seat) => seat.number) ?? [],
    );

    // Excluding seats/corridor with number '0'
    final filteredSeats =
        widget.seatsScheme?.where((seat) => seat.seatNum != '0').toList() ?? [];

    // Filling availableSeats list with values from filteredSeats
    availableSeats
      ..addAll(filteredSeats.map((seat) => seat.seatNum))
      // Removing seats from availableSeats that are present in reservedSeats
      ..removeWhere(reservedSeats.contains);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketingCubit, TicketingState>(
      bloc: widget.cubit,
      builder: (context, state) {
        final passenger = state.passengers[widget.passengerIndex];

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
          rateValue: passenger.rate,
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
        );
      },
    );
  }
}
