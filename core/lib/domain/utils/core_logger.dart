import 'dart:developer' as dev;

abstract final class CoreLogger {
  static void log(
    String logMessage, {
    Map<String, dynamic>? params,
  }) {
    dev.log(logMessage, name: '${params ?? ''}');
  }
}
