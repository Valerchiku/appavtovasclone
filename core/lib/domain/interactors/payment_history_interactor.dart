import 'package:core/domain/entities/app_entities/payment.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class PaymentHistoryInteractor {
  final IUserRepository _userRepository;

  const PaymentHistoryInteractor(this._userRepository);

  List<Payment>? get payments => _userRepository.entity.paymentHistory;
}
