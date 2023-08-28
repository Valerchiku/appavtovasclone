import 'package:core/avtovas_core.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:flutter/material.dart';

void main() {
  final oneC = OneCDataSource();
  final rep = OneCRepository(oneC);
  final interac = TicketingInteractor(rep);

  interac.getOccupiedSeat(
    tripId: '6f9443ed-3d49-11ee-a997-c0c27ca050d8',
    departure: 'Чебоксары Центральный АВ',
    destination: 'Йошкар-Ола АВ',
  );

  interac.occupiedSeatStream.listen(
    (event) => CoreLogger.log('$event'),
  );

  runApp(const AppExample());
}

final class AppExample extends StatelessWidget {
  const AppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
