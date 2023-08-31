import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_shimmer_content.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/oneC_entities/seats_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingBody extends StatefulWidget {
  final String tripId;
  final String departure;
  final String destination;
  final TicketingCubit ticketingCubit;
  const TicketingBody({
    required this.tripId,
    required this.departure,
    required this.destination,
    required this.ticketingCubit,
    super.key,
  });

  @override
  State<TicketingBody> createState() => _TicketingBodyState();
}

class _TicketingBodyState extends State<TicketingBody> {
  @override
  void initState() {
    super.initState();

    widget.ticketingCubit
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketingCubit, TicketingState>(
      builder: (context, state) {
        final cubit = widget.ticketingCubit;
        final saleSession = state.saleSession;
        final occupiedSeat = state.occupiedSeat;

        if (saleSession == null || occupiedSeat == null) {
          return const TicketingShimmerContent();
        }
        final departureDate = saleSession.trip.departureTime.formatDay(context);
        final departureTime = saleSession.trip.departureTime.formatTime();
        return ListView(
          padding: const EdgeInsets.all(AppDimensions.large),
          children: [
            TicketingHeader(
              departurePlace: saleSession.departure.name,
              arrivalPlace: saleSession.destination.name,
              tripDateTime:
                  // ignore: lines_longer_than_80_chars
                  '$departureDate ${context.locale.inside} $departureTime',
              tripPrice: context.locale.price(saleSession.amount),
            ),
            PassengerCollapsedContainer(
              ticketPrice: context.locale.price(saleSession.amount),
              onGenderChanged: cubit.onGenderChanged,
              onSurnameVisibleChanged: (value) {
                if (value != null) {
                  cubit.changeSurnameVisibility(withoutSurname: value);
                }
              },
              selectedGender: state.currentGender,
              isSurnameVisible: state.withoutSurname,
              documentsMenu: _DocumentSelector(
                onTypeChanged: cubit.changeDocumentType,
                currentDocument: state.documentType,
              ),
              ratesMenu: _RateSelector(
                onRateChanged: cubit.changeRate,
                currentRate: state.currentRate,
              ),
              placesMenu: _PlacesSelector(
                seatsScheme: saleSession.trip.bus.seatsScheme,
                occupiedSeat: occupiedSeat,
                onPlaceChanged: cubit.changePlace,
                currentPlace: state.currentPlace,
              ),
              countriesMenu: _CountriesSelector(
                currentCountry: state.currentCountry,
                onCountrySelected: cubit.changeCurrentCountry,
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
              onTap: () {},
            ),
            EmailSender(
              onChanged: (value) {},
              savedEmail: 'heenworker@gmail.com',
            ),
            AvtovasButton.text(
              padding: const EdgeInsets.all(AppDimensions.large),
              buttonText: context.locale.buyFor(
                context.locale.price(
                  saleSession.amount,
                ),
              ),
              textStyle: context.themeData.textTheme.titleLarge?.copyWith(
                color: context.theme.whiteTextColor,
                fontSize: AppFonts.sizeHeadlineMedium,
              ),
              onTap: () {},
            ),
          ].insertBetween(
            const SizedBox(height: AppDimensions.large),
          ),
        );
      },
    );
  }
}

final class _DocumentSelector extends StatelessWidget {
  final ValueChanged<DocumentTypes> onTypeChanged;
  final DocumentTypes currentDocument;

  const _DocumentSelector({
    required this.onTypeChanged,
    required this.currentDocument,
  });

  String _documentTextByType(BuildContext context, DocumentTypes type) =>
      switch (type) {
        DocumentTypes.rf => context.locale.passportRf,
        DocumentTypes.nonRf => context.locale.anotherPassport,
      };

  @override
  Widget build(BuildContext context) {
    return SelectableMenu<DocumentTypes>(
      fieldTitle: context.locale.document,
      currentLabel: _documentTextByType(context, currentDocument),
      svgAssetPath: AppAssets.supportIcon,
      backgroundColor: context.theme.containerBackgroundColor,
      menuItems: [
        for (final type in DocumentTypes.values)
          SelectableMenuItem<DocumentTypes>(
            itemLabel: _documentTextByType(context, type),
            currentValue: currentDocument,
            itemValue: type,
            onTap: () => onTypeChanged(type),
          ),
      ],
    );
  }
}

final class _CountriesSelector extends StatelessWidget {
  final String currentCountry;
  final ValueChanged<String> onCountrySelected;

  const _CountriesSelector({
    required this.currentCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    final countries = Countries.countries(context);

    return SelectableMenu<String>(
      fieldTitle: context.locale.citizenship,
      currentLabel: currentCountry,
      isScrollable: true,
      svgAssetPath: AppAssets.supportIcon,
      backgroundColor: context.theme.containerBackgroundColor,
      menuItems: [
        for (final country in countries)
          SelectableMenuItem<String>(
            itemLabel: country,
            currentValue: currentCountry,
            itemValue: country,
            onTap: () => onCountrySelected(country),
          ),
      ],
    );
  }
}

final class _RateSelector extends StatelessWidget {
  final ValueChanged<Rates> onRateChanged;
  final Rates currentRate;

  const _RateSelector({
    required this.onRateChanged,
    required this.currentRate,
  });

  String _rateTextByType(BuildContext context, Rates rate) => switch (rate) {
        Rates.child => context.locale.childish,
        Rates.adult => context.locale.adult,
      };

  @override
  Widget build(BuildContext context) {
    return SelectableMenu<Rates>(
      fieldTitle: context.locale.rate,
      currentLabel: _rateTextByType(context, currentRate),
      svgAssetPath: AppAssets.supportIcon,
      backgroundColor: context.theme.containerBackgroundColor,
      menuItems: [
        for (final rate in Rates.values)
          SelectableMenuItem<Rates>(
            itemLabel: _rateTextByType(context, rate),
            currentValue: currentRate,
            itemValue: rate,
            onTap: () => onRateChanged(rate),
          ),
      ],
    );
  }
}

final class _PlacesSelector extends StatefulWidget {
  final List<SeatsScheme>? seatsScheme;
  final List<OccupiedSeat>? occupiedSeat;
  final ValueChanged<String> onPlaceChanged;
  final String currentPlace;

  const _PlacesSelector({
    required this.seatsScheme,
    required this.occupiedSeat,
    required this.onPlaceChanged,
    required this.currentPlace,
  });

  @override
  State<_PlacesSelector> createState() => _PlacesSelectorState();
}

class _PlacesSelectorState extends State<_PlacesSelector> {
  final reservedSeats = []; // List of reserved seats
  final allSeats = []; // List of all seats

  @override
  void initState() {
    super.initState();
    initializeSeats();
  }

  void initializeSeats() {
    // Filling reservedSeats list with values from occupiedSeat
    reservedSeats.addAll(
      widget.occupiedSeat?.map((seat) => seat.number) ?? [],
    );

    // Excluding seats/corridor with number '0'
    final filteredSeats =
        widget.seatsScheme?.where((seat) => seat.seatNum != '0').toList() ?? [];

    // Filling allSeats list with values from filteredSeats
    allSeats
      ..addAll(filteredSeats.map((seat) => seat.seatNum))

      // Removing seats from allSeats that are present in reservedSeats
      ..removeWhere(reservedSeats.contains);
  }

  @override
  Widget build(BuildContext context) {
    return SelectableMenu<String>(
      fieldTitle: context.locale.seat,
      currentLabel: widget.currentPlace,
      svgAssetPath: AppAssets.supportIcon,
      backgroundColor: context.theme.containerBackgroundColor,
      menuItems: [
        for (final seat in allSeats)
          SelectableMenuItem<String>(
            itemLabel: seat,
            currentValue: widget.currentPlace,
            itemValue: seat,
            onTap: () => widget.onPlaceChanged(seat),
          ),
      ],
    );
  }
}
