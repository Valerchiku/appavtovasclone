// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/caller_methods/caller_methods.dart';
import 'package:flutter/foundation.dart';
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
    try {
      if (_requestTimes.isEven) {
        _regenerateExpectedCode();
      }

      _requestTimes++;

      if (kDebugMode) return '1111';

      final response = await http.post(
        Uri.parse(PrivateInfo.callerEndpoint),
        body: jsonEncode(
          CallerParams.initCallParams(
            phoneNumber: phoneNumber,
            uniqueV4: _uniqueV4,
            expectedCode: _code,
          ),
        ),
      );

      return expectedCode ??
          (jsonDecode(response.body) as Map<String, dynamic>)['code']
              .toString();
    } on Object catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> sendSms(int phoneNumber, {String? expectedCode}) async {
    try {
      if (_requestTimes.isEven) {
        _regenerateExpectedCode();
      }

      _requestTimes++;

      const endpointUrl =
          'https://functions.yandexcloud.net/d4e8b0b7mmm96c3l3qak';

      final requestBody = {
        'phoneNumber': phoneNumber,
        'expectedCode': _code,
      };

      final response = await http.post(
        Uri.parse(endpointUrl),
        body: jsonEncode(requestBody),
      );

      if (response.statusCode != 200) throw Exception();

      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

      final expectedCode = responseJson['code'];

      return expectedCode.toString();
    } on Object catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getInfo() {
    throw UnimplementedError();
  }

  // ignore: unused_field
  static String _uniqueV4 = generateUuid();
  static int _code = 0;
  static int _requestTimes = 0;

  void _regenerateUnique() {
    Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        _uniqueV4 = generateUuid();
      },
    );
  }

  void _regenerateExpectedCode() {
    final randInt = Random().nextInt(9000) + 1000;

    _code = randInt;
  }
}

final class TestCallerDataSource implements ICallerDataSource {
  @override
  Future<Map<String, dynamic>> getInfo() {
    throw UnimplementedError();
  }

  @override
  Future<String> initCall(int phoneNumber, {String? expectedCode}) async {
    return '1111';
  }

  @override
  Future<String> sendSms(int phoneNumber, {String? expectedCode}) async {
    return '1111';
  }
}
