import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/features/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _listener(BuildContext context, MainState state) {
    // ignore: flutter_style_todos
    // TODO: @glebDyakov 2023-08-22
  }

  bool _listenWhen(MainState prev, MainState current) {
    // ignore: flutter_style_todos
    // TODO: @glebDyakov 2023-08-22
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MainCubit>(
        child: BlocConsumer<MainCubit, MainState>(
      listener: _listener,
      listenWhen: _listenWhen,
      builder: (context, navState) {
        return const SizedBox();
      },
    ),);
  }
}
