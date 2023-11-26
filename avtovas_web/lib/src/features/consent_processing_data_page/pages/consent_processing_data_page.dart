import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/consent_processing_data_page/cubit/consent_processing_data_cubit.dart';
import 'package:avtovas_web/src/features/consent_processing_data_page/widgets/consent_processing_data_body/consent_processing_data_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsentProcessingDataPage extends StatelessWidget {
  const ConsentProcessingDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ConsentProcessingDataCubit>(
      child:
          BlocBuilder<ConsentProcessingDataCubit, ConsentProcessingDataState>(
        builder: (context, state) {
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return ConsentProcessingDataBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
