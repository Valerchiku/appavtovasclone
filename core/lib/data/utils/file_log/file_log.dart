// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';

abstract class FileLog {
  static Future<void> logFile(
    Map<String, dynamic> jsonData,
    String method,
  ) async {
    final downloadPath = await DownloadsPath.downloadsDirectory();

    final file = File('${downloadPath!.path}/$method.txt');

    const encoder = JsonEncoder.withIndent('  ');
    final prettyJsonString = encoder.convert(jsonData);

    file.writeAsStringSync(prettyJsonString);
  }

  static Future<void> logListFile(
    List jsonData,
    String method,
  ) async {
    final downloadPath = await DownloadsPath.downloadsDirectory();

    final file = File('${downloadPath!.path}/$method.txt');

    const encoder = JsonEncoder.withIndent('  ');
    final prettyJsonString = encoder.convert(jsonData);

    file.writeAsStringSync(prettyJsonString);
  }
}
