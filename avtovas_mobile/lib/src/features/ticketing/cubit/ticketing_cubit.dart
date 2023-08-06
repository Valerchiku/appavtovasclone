import 'package:common/avtovas_common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticketing_state.dart';

class TicketingCubit extends Cubit<TicketingState> {
  TicketingCubit()
      : super(
          const TicketingState(
            firstName: '',
            lastName: '',
            withoutSurname: true,
            currentGender: Genders.male,
            documentType: DocumentTypes.rf,
            // ignore: avoid-non-ascii-symbols
            currentCountry: 'Россия',
            currentRate: Rates.adult,
            // ignore: avoid-non-ascii-symbols
            currentPlace: 'Любое',
          ),
        );

  void changeRate(Rates rate) {
    emit(
      state.copyWith(currentRate: rate),
    );
  }

  void changeDocumentType(DocumentTypes documentType) {
    emit(
      state.copyWith(documentType: documentType),
    );
  }

  void changeCurrentCountry(String country) {
    emit(
      state.copyWith(currentCountry: country),
    );
  }

  void changeSurnameVisibility({required bool withoutSurname}) {
    emit(
      state.copyWith(withoutSurname: withoutSurname),
    );
  }

  void onGenderChanged(Genders gender) {
    emit(
      state.copyWith(currentGender: gender),
    );
  }
}
