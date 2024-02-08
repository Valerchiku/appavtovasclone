import 'dart:typed_data';

import 'package:core/data/data_sources/interfaces/i_mailer_data_source.dart';
import 'package:core/domain/interfaces/i_mailer_repository.dart';

final class MailerRepository implements IMailerRepository {
  final IMailerDataSource _mailerDataSource;

  MailerRepository(this._mailerDataSource);

  @override
  Future<void> sendSupportMail({
    required String userName,
    required String message,
  }) {
    return _mailerDataSource.sendSupportMail(
      userName: userName,
      message: message,
    );
  }

  @override
  Future<void> sendTicketMail({
    required String mailAddress,
    required Uint8List ticketBytes,
    required String html,
  }) {
    return _mailerDataSource.sendTicketMail(
      mailAddress: mailAddress,
      ticketBytes: ticketBytes,
      html: html,
    );
  }
}
