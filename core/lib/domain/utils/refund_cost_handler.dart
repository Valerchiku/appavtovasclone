import 'package:core/domain/utils/core_logger.dart';

abstract final class RefundCostHandler {
  static double calculateRefundCostAmount({
    required String tripCost,
    required DateTime departureDate,
    required DateTime refundDate,
  }) {
    try {
      final doubleValue = double.tryParse(tripCost);

      if (doubleValue == null) {
        throw Exception('Cannot convert String value to double!');
      }

      return _calculateRefundCostByDate(
        tripCost: doubleValue,
        departureDate: departureDate,
        refundDate: refundDate,
      );
    } catch (e) {
      CoreLogger.errorLog('Cost exception', params: {'Exception params': e});

      return -1;
    }
  }

  static double _calculateRefundCostByDate({
    required double tripCost,
    required DateTime departureDate,
    required DateTime refundDate,
  }) {
    final dateDifference = departureDate.difference(refundDate).inMinutes;

    final percentage = switch (dateDifference) {
      >= 120 => 5,
      < 120 && > 0 => 15,
      <= 0 => 25,
      _ => 0,
    };

    return _calculateDiscount(percentage, tripCost);
  }

  static double _calculateDiscount(int percentage, double cost) {
    if (percentage < 0 || percentage > 100) {
      throw ArgumentError('Percentage should be between 0 and 100 inclusive.');
    }

    return cost - ((percentage / 100) * cost);
  }
}
