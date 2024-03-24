import 'dart:typed_data';

abstract interface class IMailerDataSource {
  Future<void> sendSupportMail({
    required String userName,
    required String message,
  });

  Future<void> sendTicketMail({
    required String mailAddress,
    required Uint8List ticketBytes,
    required String html,
  });
}
