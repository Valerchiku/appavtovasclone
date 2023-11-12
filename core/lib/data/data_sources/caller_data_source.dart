import 'dart:async';
import 'dart:convert';

import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/caller_methods/caller_methods.dart';
import 'package:http/http.dart' as http;

final class CallerDataSource implements ICallerDataSource {
  CallerDataSource() {
    _regenerateUnique();
  }

  @override
  Future<String> initCall(
    int phoneNumber, {
    String? expectedCode,
  }) async {
    final response = await http.get(
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
  }

  @override
  Future<Map<String, dynamic>> getInfo() {
    throw UnimplementedError();
  }

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
