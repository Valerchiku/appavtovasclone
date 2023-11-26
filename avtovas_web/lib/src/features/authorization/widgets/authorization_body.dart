import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/navigation/routes.dart';
import 'package:avtovas_web/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;

final class AuthorizationBody extends StatefulWidget {
  final AuthorizationContent content;
  final AuthorizationCubit cubit;
  final String? phoneNumber;

  const AuthorizationBody({
    required this.content,
    required this.cubit,
    this.phoneNumber,
    super.key,
  });

  @override
  State<AuthorizationBody> createState() => _AuthorizationBodyState();
}

class _AuthorizationBodyState extends State<AuthorizationBody> {
  @override
  void initState() {
    super.initState();

    html.window.history.replaceState(
      '',
      '',
      Routes.authPath.name,
    );

    widget.cubit.changeContent(widget.content);
    if (widget.phoneNumber != null) {
      widget.cubit.onNumberChanged(
        widget.phoneNumber!.stringE164PhoneFormat(),
        automaticallyCall: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationCubit, AuthorizationState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: AppDimensions.extraLarge),
            SizedBox(
              width: 600,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: KeyedSubtree(
                  key: ValueKey<AuthorizationContent>(state.content),
                  child: state.content == AuthorizationContent.phone
                      ? AuthorizationPhoneContainer(
                          onNumberChanged: widget.cubit.onNumberChanged,
                          onSendButtonTap: widget.cubit.onSendButtonTap,
                          onTextTap: () {},
                          number: state.phoneNumber.stringE164PhoneFormat(),
                        )
                      : AuthorizationCodeContainer(
                          onCodeEntered: widget.cubit.onCodeEntered,
                          onResendButtonTap: widget.cubit.onResendButtonTap,
                          onTextTap: () {},
                          number: state.phoneNumber.stringE164PhoneFormat(),
                          isError: state.isErrorCode,
                          resetErrorStatus: widget.cubit.resetErrorStatus,
                          errorMessage: 'Введённый код неверен!',
                        ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.extraLarge * 4),
          ],
        );
      },
    );
  }
}
