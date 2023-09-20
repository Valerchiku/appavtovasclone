// ignore_for_file: cascade_invocations

import 'dart:convert';

import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

abstract class XmlConverter {
  static XmlDocument parsedXml(String xml) => XmlDocument.parse(xml);

  static List<Map<String, dynamic>> xml2JsonConvert({
    required String response,
    required String xmlRequestName,
  }) {
    // Parse the XML document from the HTTP response
    final doc = XmlDocument.parse(response);

    // Find the 'soap:Envelope' element
    final soapEnvelope = doc.findElements('soap:Envelope').first;
    // Find the 'soap:Body' element within 'soap:Envelope'
    final soapBody = soapEnvelope.findElements('soap:Body').first;
    // Find the 'm:GetBusStopsResponse' element within 'soap:Body'
    final methodResponse = soapBody.findElements(xmlRequestName).first;
    // Find the 'm:return' element within 'm:GetBusStopsResponse'
    final returnResponse = methodResponse.findElements('m:return').first;
    // 'Elements' elements within 'm:return'
    final elements = returnResponse.findElements('Elements');
    // Convert the found 'Elements' elements into a list
    final elementsList = elements.toList();
    // Convert the 'Elements' XML into JSON objects using the _fromXmlToJson
    final jsonData = _fromXmlToJson(elementsList);
    return jsonData;
  }

  static List<Map<String, dynamic>> _fromXmlToJson(
    List<XmlElement> elements,
  ) {
    // Create a list to store JSON objects
    final jsonList = <Map<String, dynamic>>[];
    for (final element in elements) {
      // Create an empty JSON object for each XML element
      final json = <String, dynamic>{};

      for (final node in element.children) {
        if (node is XmlElement) {
          if (node.children.length == 1 && node.children.first is XmlText) {
            // If the element has only one child text node,
            // just assign a value to the key
            json[node.name.local] = node.innerText;
          } else {
            final childrenJson = _childrenFromXmlToJson(node.children);
            json[node.name.local] =
                childrenJson.isNotEmpty ? childrenJson : null;
          }
        }
      }
      // Add the populated JSON object to the list
      jsonList.add(json);
    }

    return jsonList;
  }

  static Map<String, dynamic> _childrenFromXmlToJson(List<XmlNode> nodes) {
    final json = <String, dynamic>{};

    for (final node in nodes) {
      if (node is XmlElement) {
        if (node.children.length == 1 && node.children.first is XmlText) {
          // If an element has only one child text node,
          // assign a value to the key
          json[node.name.local] = node.innerText;
        } else {
          final childrenJson = _childrenFromXmlToJson(node.children);
          json[node.name.local] = childrenJson.isNotEmpty ? childrenJson : null;
        }
      }
    }

    return json;
  }

  static Map<String, dynamic> packageXmlConverter({required String xml}) {
    final xmlResponse = xml;
    final xml2json = Xml2Json();
    xml2json.parse(xmlResponse);
    final jsonString = xml2json.toParker();
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    return jsonData;
  }
}
