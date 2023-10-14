import 'package:core/domain/entities/avibus/avibus.dart';

abstract interface class IPostgresConfigDataSource {
  Stream<Map<String, List<String>>> get configStream;

  Map<String, List<String>> get config;
}
