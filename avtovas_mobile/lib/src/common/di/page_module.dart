import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/main/pages/main_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/pages/trip_details_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';
import 'package:flutter/material.dart';

void registerPage({required Widget widget}) => i.registerFactory(
      () => widget,
    );

void unregisterPage<T extends Widget>() => i.unregister<T>();

void initPages() {
  i
    ..registerSingleton<MainPage>(MainPage())
    ..registerFactory<TripsSchedulePage>(TripsSchedulePage.new)
    ..registerFactory<TripDetailsPage>(TripDetailsPage.new);
}
