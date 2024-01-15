import 'dart:convert';

import 'package:core/avtovas_core.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() async {
  final response = await http.post(
    Uri.parse('https://functions.yandexcloud.net/d4e9aq03mqaqkbf2997j'),
    body: jsonEncode(
      {
        'deviceToken':
            'fa4LdFqzR7WtSEmjJ83-ex:APA91bF4I-P-hjrNsc1Pl5OTQMnSJjB0WAfQSVPdaNL8dXNY0huLO4JB1tmNxkjJZPIqf08pe6AQ6L98hrZg7eEDiCw_ynvzhvI9AY5Q1I5C91Y_ZHQNHSE5uZU_Zo04AkWj-hTxZiex',
        'title': 'notificationTitle',
        'body': 'notificationMessage',
        'imageUrl':
            'https://rgo.ru/upload/content_block/images/9ca8302358b777e143cd6e314058266b/7065323d0aa2e3fa6e8764c4f57f1655.jpg?itok=sawvdjq3',
        '': '',
      },
    ),
  );

  runApp(
    const MaterialApp(
      home: Scaffold(),
    ),
  );
}
