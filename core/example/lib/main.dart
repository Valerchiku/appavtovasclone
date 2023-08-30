import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

void main() {
  final oneC = OneCDataSource();
  final rep = OneCRepository(oneC);
  final interactor = TicketingInteractor(rep);

  interactor.addTickets(
    orderId: 'ЦБ002623611',
    fareName: 'Пассажирский',
    seatNum: '16',
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
