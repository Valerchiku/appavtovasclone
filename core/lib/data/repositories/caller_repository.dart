import 'package:core/data/data_sources/interfaces/i_caller_data_source.dart';
import 'package:core/domain/interfaces/i_caller_repository.dart';

final class CallerRepository implements ICallerRepository {
  final ICallerDataSource _callerDataSource;

  CallerRepository(this._callerDataSource);

  @override
  Future<String> initCall(
    int phoneNumber, {
    String? expectedCode,
  }) {
    return _callerDataSource.initCall(
      phoneNumber,
      expectedCode: expectedCode,
    );
  }

  @override
  Future<Map<String, dynamic>> getInfo() {
    return _callerDataSource.getInfo();
  }
}
