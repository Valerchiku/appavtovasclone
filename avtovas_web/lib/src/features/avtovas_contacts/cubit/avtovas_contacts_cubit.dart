import 'dart:async';

import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/interactors/avtovas_contacts_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avtovas_contacts_state.dart';

class AvtovasContactsCubit extends Cubit<AvtovasContactsState> {
  final AvtovasContactsInteractor _avtovasContactsInteractor;

  AvtovasContactsCubit(this._avtovasContactsInteractor)
      : super(
          const AvtovasContactsState(
            avtovasPhoneNumber: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<Avibus>>? _avtovasPhoneNumberSubscription;

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

  @override
  Future<void> close() {
    _avtovasPhoneNumberSubscription?.cancel();
    _avtovasPhoneNumberSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _avtovasPhoneNumberSubscription?.cancel();
    _avtovasPhoneNumberSubscription = null;

    _avtovasPhoneNumberSubscription =
        _avtovasContactsInteractor.avibusSettingsStream.listen(
      (settings) {
        emit(
          state.copyWith(avtovasPhoneNumber: settings.first.clientPhoneNumber),
        );
      },
    );
  }
}
