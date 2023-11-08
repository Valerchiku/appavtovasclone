// ignore_for_file: prefer_const_literals_to_create_immutables,
// unused_local_variable

import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/main/cubit/main_search_cubit.dart';
import 'package:avtovas_web/src/features/main/widgets/main_search_body/main_search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSearchPage extends StatefulWidget {
  const MainSearchPage({super.key});

  @override
  State<MainSearchPage> createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  @override
  Widget build(BuildContext context) {
    return CubitScope<MainSearchCubit>(
      child: BlocBuilder<MainSearchCubit, MainSearchState>(
        builder: (context, state) {
          final cubit = CubitScope.of<MainSearchCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return MainSearchBody(
                smartLayout: smartLayout,
                mobileLayout: mobileLayout,
                cubit: cubit,
              );
            },
          );
        },
      ),
    );
  }
}
