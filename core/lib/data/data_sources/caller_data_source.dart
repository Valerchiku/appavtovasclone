// ignore_for_file: unused_import

import 'dart:async';

import 'package:core/avtovas_core.dart';

final class CallerDataSource implements ICallerDataSource {
  CallerDataSource() {
    _regenerateUnique();
  }

  @override
  Future<String> initCall(
    int phoneNumber, {
    String? expectedCode,
  }) async {
    /*final response = await http.get(
      Uri.parse(
        CallerMethods.initCall(
          secretKey: PrivateInfo.callerSecretKey,
          serviceId: PrivateInfo.callerServiceId,
          phoneNumber: phoneNumber,
          uniqueV4: _uniqueV4,
          expectedCode: expectedCode,
        ),
      ),
    );

    return expectedCode ??
        (jsonDecode(response.body) as Map<String, dynamic>)['code'].toString();
        */

    return '1111';
  }

  @override
  Future<Map<String, dynamic>> getInfo() {
    throw UnimplementedError();
  }

  // ignore: unused_field
  static String _uniqueV4 = generateUuid();

  void _regenerateUnique() {
    Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        _uniqueV4 = generateUuid();
      },
    );
  }
}
