import 'dart:convert';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

// ignore_for_file: cascade_invocations

abstract class XmlConverter {
  Map<String, dynamic> xmlToJson({required Response response}) {
    final xmlResponse = response.body;
    final xml2Json = Xml2Json();
    xml2Json.parse(xmlResponse);
    final jsonString = xml2Json.toParker();
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }
}
