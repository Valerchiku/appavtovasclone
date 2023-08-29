abstract final class SQLRequests {
  static String selectSingle({
    required String tableName,
    required Map<String, dynamic> fields,
  }) {
    return 'SELECT * FROM $tableName WHERE ${fields.keys.map(
          (e) => '$e = ${fields[e]}',
        ).join(', ')}';
  }

  static String insertInto({
    required String tableName,
    required Map<String, dynamic> fields,
  }) {
    return 'INSERT INTO '
        '$tableName '
        '(${fields.keys.join(', ')}) '
        'VALUES '
        '(${fields.values.join(', ')});';
  }
}
