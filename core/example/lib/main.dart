import 'package:flutter/material.dart';
import 'package:core/avtovas_core.dart';

void main() {
  final oneC = OneCDataSource();
  final rep = OneCRepository(oneC);
  final inter = TicketingInteractor(rep);

  inter.getOccupiedSeat(
    tripId: '73f5b1b0-4200-11ee-a997-c0c27ca050d8',
    departure: 'Чебоксары Центральный АВ',
    destination: 'Йошкар-Ола АВ',
  );
  
  inter.occupiedSeatStream.listen((event) => print(event));

  runApp(const AppExample());
}

final class AppExample extends StatelessWidget {
  const AppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
