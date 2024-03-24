abstract final class SQLRequests {
  static String selectFrom({required String tableName}) {
    return 'SELECT * FROM $tableName';
  }

  static String selectSingle({
    required String tableName,
    required Map<String, dynamic> fieldsMap,
  }) {
    return 'SELECT * FROM $tableName WHERE ${fieldsMap.keys.map(
          (e) => '$e = ${fieldsMap[e]}',
        ).join(', ')}';
  }

  static String insertInto({
    required String tableName,
    required Map<String, dynamic> fieldsMap,
  }) {
    return 'INSERT INTO '
        '$tableName '
        '(${fieldsMap.keys.join(', ')}) '
        'VALUES '
        '(${fieldsMap.values.join(', ')});';
  }

  static String updateSingle({
    required String tableName,
    required Map<String, dynamic> fieldsMap,
    required Map<String, dynamic> uniqueMap,
  }) {
    return 'UPDATE $tableName SET '
        '${fieldsMap.keys.map((e) => '$e = ${fieldsMap[e]}').join(', ')} '
        'WHERE '
        '${uniqueMap.keys.map((e) => '$e = ${uniqueMap[e]}').join(', ')}';
  }

  static Map<String, String> queryBody(String query) => {'query': query};
}
