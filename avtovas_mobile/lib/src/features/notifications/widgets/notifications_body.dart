import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/notifications/cubit/notifications_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_ticketing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final notificationsCubit = CubitScope.of<NotificationsCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(
            AppDimensions.large,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale.sendPushNotificationsBeforeRace,
                      style: context.themeData.textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    CupertinoSwitch(
                      activeColor: context.theme.mainAppColor,
                      value: notificationsCubit.state.showNotifications,
                      onChanged: (value) {
                        notificationsCubit.updateNotificationsStatus(
                          notificationsStatus: value,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.extraLarge),
                _EmailSelector(
                  key: ValueKey<String>(state.userEmail),
                  currentEmail: state.userEmail,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _EmailSelector extends StatefulWidget {
  final String currentEmail;

  const _EmailSelector({required this.currentEmail, super.key});

  @override
  State<_EmailSelector> createState() => _EmailSelectorState();
}

class _EmailSelectorState extends State<_EmailSelector> {
  late final TextEditingController _textEditingController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController()
      ..text = widget.currentEmail
      ..addListener(() => setState(() {}));

    _focusNode = FocusNode()..addListener(() => setState(() {}));
  }

  void _saveNewEmail(BuildContext context) {
    final newEmail = _textEditingController.text;

    if (EmailValidator.validateEmail(newEmail)) {
      CubitScope.of<NotificationsCubit>(context).addNewUserEmail(
        email: newEmail,
      );
      _showEmailInfoDialog(context, 'Email-адрес успешно обновлен');
    } else {
      _showEmailInfoDialog(context, 'Введен некорректный email-адрес');
    }
  }

  Future<void> _showEmailInfoDialog(BuildContext context, String msg) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: msg,
          withCancel: false,
        );
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Email-адрес',
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.medium),
        Row(
          children: [
            Expanded(
              child: CupertinoTextField(
                focusNode: _focusNode,
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.large,
                  horizontal: AppDimensions.medium,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: _focusNode.hasFocus
                          ? context.theme.secondaryTextColor
                          : context.theme.fivefoldTextColor,
                    ),
                  ),
                ),
                placeholder: 'Добавьте Ваш Email',
                controller: _textEditingController,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.medium),
        Text(
          'Email-адрес может быть использован для отправки электронной копии купленного билета и чека',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: context.theme.quaternaryTextColor,
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        AvtovasButton.text(
          onTap: () => _saveNewEmail(context),
          isActive: widget.currentEmail != _textEditingController.text,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.mediumLarge,
          ),
          buttonText: 'Сохранить',
        ),
      ],
    );
  }
}
