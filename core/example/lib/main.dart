import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

void main() {
  final oneC = OneCDataSource();
  final rep = OneCRepository(oneC);
  final interactor = TicketingInteractor(rep);

  interactor.reserveOrder(
    orderId: 'ЦБ002634823',
    name: 'Дроздов Щегол Филинович',
    phone: '+7 (000) 000-00-00',
    email: 'example@example.com',
    comment: 'Test',
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
