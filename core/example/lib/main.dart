import 'package:flutter/material.dart';
import 'package:core/avtovas_core.dart';

void main() {
  final oneCData = OneCDataSource();
  final rep = OneCRepository(oneCData);
  final interactor = SearchInteractor(rep);

  interactor.getTrips(
    departure: 'Чебоксары Центральный АВ',
    destination: 'Автовокзал Йошкар-Ола',
    tripsDate: '2023-08-15',
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
