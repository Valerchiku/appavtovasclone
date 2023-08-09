import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/terms/cubit/terms_cubit.dart';
import 'package:avtovas_mobile/src/features/terms/utils/terms_item.dart';
import 'package:avtovas_mobile/src/features/terms/widgets/terms_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({
    super.key,
  });

  void _listener(BuildContext context, TermsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TermsState prev, TermsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  slideToPage(context, termsItem) {
    Navigator.of(context).push(_createRoute(termsItem));
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TermsDetailPage(
        termsItem: termsItem,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TermsCubit>(
        child: BlocConsumer<TermsCubit, TermsState>(
            listener: _listener,
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<TermsCubit>(context);
              return BaseNavigationPage(
                appBarTitle: context.locale.termsTitle,
                leadingSvgPath: AppAssets.backArrowIcon,
                onLeadingTap: cubit.onBackButtonTap,
                onNavigationItemTap: cubit.onNavigationItemTap,
                body: TermsBody(onPrivacyPolicyTap: () {
                  slideToPage(context, TermsItem.privacyPolicy);
                }, onConsentToProcessingTap: () {
                  slideToPage(context, TermsItem.consentToProcessing);
                }, onContractOfferTap: () {
                  slideToPage(context, TermsItem.contractOffer);
                }),
              );
            }));
  }
}

Route _createRoute(TermsItem termsItem) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        TermsDetailPage(termsItem: termsItem),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class TermsDetailPage extends StatefulWidget {
  final TermsItem termsItem;

  const TermsDetailPage({required this.termsItem, super.key});

  @override
  State<StatefulWidget> createState() => _TermsDetailPageState();
}

class _TermsDetailPageState extends State<TermsDetailPage> {
  void _listener(BuildContext context, TermsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TermsState prev, TermsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TermsCubit>(
        child: BlocConsumer<TermsCubit, TermsState>(
            listener: _listener,
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<TermsCubit>(context);
              var title = '';
              var content = null;
              switch (widget.termsItem) {
                case TermsItem.privacyPolicy:
                  title = 'Политика конфиденциальности\nООО «АВТОВАС»';
                  content = ListView(
                    padding: EdgeInsets.all(
                      AppDimensions.preExtraLarge,
                    ),
                    children: [
                      Text(
                        'Согласие на обработку персональных данных\nребенка',
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                          bottom: AppDimensions.preExtraLarge,
                        ),
                        child: Text(
                            'АВТОВАС понимает важность дополнительных мер предосторожности для обеспечения конфиденциальности и безопасности детей при использовании ими услуг, предоставляемых АВТОВАС.\nОбращаем внимание, что в случае оформлении билета на ребенка младше 18 лет, согласие на обработку его персональных данных дает его законный представитель (родитель/опекун) - если Вам меньше 18 лет, не вводите на нашем сайте свои персональные данные без одобрения родителей/опекунов и не пользуйтесь услугами нашего сайта.\nБАСФОР сознательно не собирает персональные данные о детях до 18 лет. Если Вы (Пользователь) считаете, что мы непреднамеренно собрали подобную информацию, свяжитесь с нами по электронному адресу help@busfor.ru, чтобы мы получили согласие законного представителя либо удалили эти данные.'),
                      ),
                      Text(
                        'Способы и сроки обработки персональных\nданных',
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                        ),
                        child: Text(
                            'Обработка персональных данных Пользователя включает в себя любое действие (операция) или совокупность действий (операций), совершаемых с использованием средств автоматизации или без использования таких средств с персональными данными, включая сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (распространение, предоставление, доступ), в том числе трансграничную передачу, обезличивание, блокирование, удаление, уничтожение персональных данных.'),
                      ),
                    ],
                  );
                  break;
                case TermsItem.consentToProcessing:
                  title =
                      'Соглашение между пользователем сайта\nАВТОВАС и компанией ООО «АВТОВАС»';
                  content = ListView(
                    padding: EdgeInsets.all(
                      AppDimensions.preExtraLarge,
                    ),
                    children: [
                      Text(
                        '1. Общие положения',
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                        ),
                        child: Text(
                            '1.1. ООО «АВТОВАС» (далее по тексту – «АВТОВАС») предлагает Пользователям использовать сервис для поиска и покупки билетов на автобусы, размещенный на интернет-портале www.avtobas.ru(далее - avtobas.ru) на условиях, изложенных в настоящем Пользовательском соглашении (далее – Соглашение). Соглашение может быть изменено АВТОВАС без какого-либо специального уведомления, новая редакция Соглашения вступает в силу с момента ее размещения на www.busfor.ru, если иное не предусмотрено новой редакцией Соглашения.\n\n1.2. Воспользовавшись любой функциональной возможностью avtobas.ru, Пользователь выражает свое безоговорочное согласие со всеми условиями настоящего Соглашения и обязуется их соблюдать или прекратить использование busfor.ru\n\n1.3. Для того, чтобы воспользоваться сервисом для поиска и бронирования билетов на автобусы, размещенном на avtobas.ru, Пользователю необходимо иметь компьютер и доступ в Интернет. Все вопросы приобретения прав доступа в Интернет, покупки и наладки соответствующего оборудования и программных продуктов решаются Пользователем самостоятельно и не подпадают под действие настоящего Соглашения.'),
                      ),
                    ],
                  );
                  break;
                case TermsItem.contractOffer:
                  title =
                      'Соглашение между пользователем сайта\nАВТОВАС и компанией ООО «АВТОВАС»';
                  content = ListView(
                    padding: EdgeInsets.all(
                      AppDimensions.preExtraLarge,
                    ),
                    children: [
                      Text(
                        '1. Общие положения',
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                        ),
                        child: Text(
                            '1.1. ООО «АВТОВАС» (далее по тексту – «АВТОВАС») предлагает Пользователям использовать сервис для поиска и покупки билетов на автобусы, размещенный на интернет-портале www.avtobas.ru(далее - avtobas.ru) на условиях, изложенных в настоящем Пользовательском соглашении (далее – Соглашение). Соглашение может быть изменено АВТОВАС без какого-либо специального уведомления, новая редакция Соглашения вступает в силу с момента ее размещения на www.busfor.ru, если иное не предусмотрено новой редакцией Соглашения.\n\n1.2. Воспользовавшись любой функциональной возможностью avtobas.ru, Пользователь выражает свое безоговорочное согласие со всеми условиями настоящего Соглашения и обязуется их соблюдать или прекратить использование busfor.ru\n\n1.3. Для того, чтобы воспользоваться сервисом для поиска и бронирования билетов на автобусы, размещенном на avtobas.ru, Пользователю необходимо иметь компьютер и доступ в Интернет. Все вопросы приобретения прав доступа в Интернет, покупки и наладки соответствующего оборудования и программных продуктов решаются Пользователем самостоятельно и не подпадают под действие настоящего Соглашения.'),
                      ),
                    ],
                  );
                  break;
              }
              return BaseNavigationPage(
                appBarTitle: title,
                leadingSvgPath: AppAssets.backArrowIcon,
                onLeadingTap: cubit.onBackButtonTap,
                onNavigationItemTap: cubit.onNavigationItemTap,
                body: content,
              );
            }));
  }
}
