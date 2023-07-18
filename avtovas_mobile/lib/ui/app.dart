import 'package:avtovas_mobile/ui/pages/bus_routes_page/bus_routes_page.dart';
import 'package:flutter/material.dart';

class AvtoVasApp extends StatelessWidget {
  const AvtoVasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BusRoutesPage(),
    );
  }
}