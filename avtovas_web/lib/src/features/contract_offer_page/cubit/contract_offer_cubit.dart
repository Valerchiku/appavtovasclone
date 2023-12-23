import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contract_offer_state.dart';

class ContractOfferCubit extends Cubit<ContractOfferState> {
  ContractOfferCubit()
      : super(
          const ContractOfferState(
            route: CustomRoute(null, null),
          ),
        );
}
