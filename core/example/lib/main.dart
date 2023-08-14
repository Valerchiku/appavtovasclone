import 'package:flutter/material.dart';
import 'package:core/avtovas_core.dart';

void main() {
  final oneCData = OneCDataSource();
  final rep = OneCRepository(oneCData);
  final interactor = SearchInteractor(rep);

  interactor.avtovasBusStopsStream.listen((event) { 
    print(event[0].address);
  });
  
  runApp(const AppExample());
}

final class AppExample extends StatelessWidget {
  const AppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
