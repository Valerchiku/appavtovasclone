import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/interactors/avtovas_contacts_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avtovas_contacts_state.dart';

class AvtovasContactsCubit extends Cubit<AvtovasContactsState> {
  final AvtovasContactsInteractor _avtovasContactsInteractor;

  AvtovasContactsCubit(this._avtovasContactsInteractor)
      : super(
          const AvtovasContactsState(
            route: CustomRoute(null, null),
          ),
        );

  Future<void> sendSupportMail({
    required String userName,
    required String mailAddress,
    required String phoneNumber,
    required String message,
  }) {
    return _avtovasContactsInteractor.sendMail(
      userName: userName,
      mailAddress: mailAddress,
      phoneNumber: phoneNumber,
      message: message,
    );
  }
}
