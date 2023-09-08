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
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingBody extends StatefulWidget {
  final String tripId;
  final String departure;
  final String destination;
  final TicketingCubit cubit;

  const TicketingBody({
    required this.tripId,
    required this.departure,
    required this.destination,
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

    widget.cubit
      ..startSaleSession(
        tripId: widget.tripId,
        departure: widget.departure,
        destination: widget.destination,
      )
      ..getOccupiedSeats(
        tripId: widget.tripId,
        departure: widget.departure,
        destination: widget.destination,
      );

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

  String _priceByRate(
    String passengerRate,
    List<SingleTripFares?> rates,
  ) {
    return rates
            .firstWhereOrNull((rate) => rate?.name == passengerRate)
            ?.cost ??
        '0';
  }

  String _finalPriceByRate(
    List<String> passengerRates,
    List<SingleTripFares?> rates,
  ) {
    final prices = passengerRates
        .map(
          (passRate) => rates
              .map((rate) => passRate == rate?.name ? rate?.cost ?? '0' : '0'),
        )
        .expand((prices) => prices)
        .toList();

    var finalPrice = 0;

    for (final price in prices) {
      finalPrice += int.tryParse(price) ?? 0;
    }

    return finalPrice.toString();
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
        final addTicket = state.addTicket;

        if (saleSession == null || occupiedSeat == null) {
          return const TicketingShimmerContent();
        }

        final departureDate = saleSession.trip.departureTime.formatDay(context);
        final departureTime = saleSession.trip.departureTime.formatTime();
        final finalPrice = _finalPriceByRate(
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
                    ticketPrice: _priceByRate(
                      state.passengers[index].rate,
                      saleSession.trip.fares,
                    ),
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
                  savedEmail: state.availableEmails?.first ?? '',
                  isSavedEmailUsed:
                      state.useSavedEmail && state.availableEmails != null,
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
        );
      },
    );
  }
}

final class _PassengerCollapsedContainer extends StatelessWidget {
  final TicketingCubit cubit;
  final VoidCallback onRemoveTap;
  final int passengerIndex;
  final String ticketPrice;
  final List<GlobalKey<FormState>>? validateKeys;

  const _PassengerCollapsedContainer({
    required this.cubit,
    required this.onRemoveTap,
    required this.passengerIndex,
    required this.ticketPrice,
    required this.validateKeys,
  });

  Future<void> _showSelector(
    BuildContext context,
    List<Passenger>? passengers,
  ) async {
    await SupportMethods.showAvtovasBottomSheet(
      sheetTitle: 'Пассажиры',
      context: context,
      child: PassengerSelectorSheet(
        existentPassengers: passengers,
        onPassengerChanged: (passenger) => cubit.changeIndexedPassenger(
          passengerIndex: passengerIndex,
          existentPassenger: passenger,
        ),
      ),
    );

    for (final key in validateKeys ?? <GlobalKey<FormState>>[]) {
      key.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketingCubit, TicketingState>(
      bloc: cubit,
      builder: (context, state) {
        final passenger = state.passengers[passengerIndex];

        return PassengerCollapsedContainer(
          formKeys: validateKeys,
          isGenderError: state.genderErrors[passengerIndex],
          onGenderChanged: () {
            cubit.changeGenderErrorStatus(index: passengerIndex, status: false);
          },
          // TODO(dev): Pass real seats here.
          availableSeats: const ['1', '2', '3', '4'],
          onSeatChanged: (value) => cubit.changePassengerSeatNumber(
            passengerIndex: passengerIndex,
            seat: value,
          ),
          passengerNumber: passengerIndex + 1,
          withRemoveButton: passengerIndex != 0,
          removePassenger: onRemoveTap,
          ticketPrice: context.locale.price(ticketPrice),
          onSurnameVisibleChanged: (value) => cubit.changeSurnameVisibility(
            passengerIndex: passengerIndex,
            withoutSurname: value,
          ),
          noSurname: state.surnameStatuses[passengerIndex],
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
            cubit.changeIndexedPassenger(
              passengerIndex: passengerIndex,
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
          seatValue: state.seats[passengerIndex],
          onSelectPassengerTap: () {
            _showSelector(
              context,
              state.existentPassengers,
            );
            cubit.changeGenderErrorStatus(index: passengerIndex, status: false);
          },
        );
      },
    );
  }
}
