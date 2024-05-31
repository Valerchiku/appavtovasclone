import 'package:avtovas_mobile/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  AnimatedSwitcher(
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
                              onTextTap: widget.cubit.onTextTap,
                              onTermsTap: widget.cubit.navigateToTerms,
                              number: state.phoneNumber.stringE164PhoneFormat(),
                            )
                          : AuthorizationCodeContainer(
                              onCodeEntered: widget.cubit.onCodeEntered,
                              onSmsSendButtonTap: widget.cubit.sendSms,
                              onResendButtonTap: widget.cubit.onResendButtonTap,
                              onTextTap: widget.cubit.onTextTap,
                              number: state.phoneNumber.stringE164PhoneFormat(),
                              isError: state.isErrorCode,
                              resetErrorStatus: widget.cubit.resetErrorStatus,
                              errorMessage: 'Введённый код неверен!',
                            ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
