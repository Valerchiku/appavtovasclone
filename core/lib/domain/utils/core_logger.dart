import 'package:logger/logger.dart' as logger;

abstract final class CoreLogger {
  static final _loggerInstance = logger.Logger();

  static void infoLog(
    String logMessage, {
    Map<String, dynamic>? params,
  }) {
    _loggerInstance.i('''
      $logMessage 
      
      ${params == null ? '' : 'Info Params:'}
      ${params ?? ''}
    ''');
  }

  static void errorLog(
    String logMessage, {
    Map<String, dynamic>? params,
  }) {
    _loggerInstance.e('''
      $logMessage 
      
      ${params == null ? '' : 'Error Params:'}
      ${params ?? ''}
    ''');
  }
}
