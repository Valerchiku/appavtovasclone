import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/main_search/cubit/main_search_cubit.dart';
import 'package:avtovas_mobile/src/features/main_search/widgets/main_search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class MainSearchPage extends StatelessWidget {
  const MainSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<MainSearchCubit>(
      child: BaseNavigationPage(
        body: BlocBuilder<MainSearchCubit, MainSearchState>(
          builder: (context, state) {
            return const MainSearchBody();
          },
        ),
      ),
    );
  }
}
