import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/contract_offer_page/cubit/contract_offer_cubit.dart';
import 'package:avtovas_web/src/features/contract_offer_page/widgets/contract_offer_body/contract_offer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractOfferPage extends StatelessWidget {
  const ContractOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ContractOfferCubit>(
      child:
          BlocBuilder<ContractOfferCubit, ContractOfferState>(
        builder: (context, state) {
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return ContractOfferBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
