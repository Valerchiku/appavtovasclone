import 'package:xml/xml.dart';

abstract class XmlConverter {
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
    final methodResponse = soapBody.findElements('m:GetBusStopsResponse').first;
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

  static List<Map<String, dynamic>> _fromXmlToJson(List<XmlElement> elements) {
    // Create a list to store JSON objects
    final jsonList = <Map<String, dynamic>>[];
    for (final element in elements) {
      // Create an empty JSON object for each XML element
      final json = <String, dynamic>{};

      for (final node in element.children) {
        if (node is XmlElement) {
          // Map the XML element's local name to its text content in the JSON object
          json[node.name.local] = node.innerText;
        }
      }
      // Add the populated JSON object to the list
      jsonList.add(json);
    }

    return jsonList;
  }
}
