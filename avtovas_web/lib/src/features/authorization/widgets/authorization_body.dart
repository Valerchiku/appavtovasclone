import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/navigation/routes.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_local_captcha/avtovas_local_captcha.dart';
import 'package:avtovas_web/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:universal_html/html.dart' as html;

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

  Future<void> _showCaptchaDialog(BuildContext context, VoidCallback action) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasLocalCaptcha(
          onCaptchaPassed: () {
            Navigator.pop(context);
            action();
          },
          onAttemptFailed: () {
            Navigator.pop(context);
          },
        );
      },
    );
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
                          onTermsTap: widget.cubit.navigateToTerms,
                          onSendButtonTap: () => _showCaptchaDialog(
                            context,
                            widget.cubit.onSendButtonTap,
                          ),
                          onTextTap: widget.cubit.navigateToPrivacyPolicy,
                          number: state.phoneNumber.stringE164PhoneFormat(),
                        )
                      : AuthorizationCodeContainer(
                          onCodeEntered: widget.cubit.onCodeEntered,
                          onSmsSendButtonTap: widget.cubit.sendSms,
                          onResendButtonTap: () => _showCaptchaDialog(
                            context,
                            widget.cubit.onResendButtonTap,
                          ),
                          onTextTap: widget.cubit.navigateToPrivacyPolicy,
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
