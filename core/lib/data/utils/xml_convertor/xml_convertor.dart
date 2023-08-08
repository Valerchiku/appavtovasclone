import 'dart:convert';
import 'package:core/data/utils/constants/xml_request_name.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: cascade_invocations

abstract class XmlConverter {
  List<Map<String, dynamic>> xmlToJson({
    required Response response,
    required XmlRequestName xmlRequestName,
  }) {
    final xmlResponse = response.body;
    final xml2Json = Xml2Json();
    xml2Json.parse(xmlResponse);
    final jsonString = xml2Json.toParker();
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData['soap:Envelope']['soap:Body'][xmlRequestName]
        ['m:return']['Elements'];
  }
}
