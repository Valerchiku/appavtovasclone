import 'package:core/domain/entities/domain_object.dart';

final class DbInfo extends DomainObject {
  final String url;
  final Map<String, String> header;
  final String dbName;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        url,
        header,
      ];

  const DbInfo({
    required this.url,
    required this.header,
    required this.dbName,
  });

  @override
  DbInfo copyWith() {
    return DbInfo(
      url: url,
      header: header,
      dbName: dbName,
    );
  }

  @override
  int get hashCode => url.hashCode;

  @override
  bool operator ==(Object other) {
    return other is DbInfo && url == other.url;
  }
}
