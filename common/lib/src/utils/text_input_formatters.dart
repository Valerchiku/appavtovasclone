import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

abstract final class TextInputFormatters {
  static _MaskEntity documentDataFormatter(
    BuildContext context,
    String documentType,
  ) {
    return switch (context.locale.localeName) {
      'ru' => _ruDocumentDataFormatter(documentType),
      _ => _ruDocumentDataFormatter(documentType)
    };
  }

  static _MaskEntity _ruDocumentDataFormatter(String documentType) {
    return switch (documentType) {
      'Паспорт гражданина РФ' => _MaskEntity(
          mask: '00 00 000000',
          filter: {
            '0': RegExp(r'\d'),
          },
        ),
      'Военный билет' => _MaskEntity(
          mask: 'UU 0000000',
          filter: {
            'U': RegExp('[a-zA-Zа-яА-Я]'),
            '0': RegExp(r'\d'),
          },
        ),
      'Загранпаспорт гражданина РФ' => _MaskEntity(
          mask: '00 0000000',
          filter: {
            '0': RegExp(r'\d'),
          },
        ),
      'Паспорт моряка' => _MaskEntity(
          mask: 'UU 0000000',
          filter: {
            'U': RegExp('[a-zA-Zа-яА-Я]'),
            '0': RegExp(r'\d'),
          },
        ),
      _ => _MaskEntity(
          mask: '000000000000000000000000000000000000000000000',
          filter: {'0': RegExp(r'^[a-zA-Zа-яА-Я\d\s]+$')},
        ),
    };
  }
}

final class _MaskEntity {
  final String mask;
  final Map<String, RegExp> filter;

  const _MaskEntity({
    required this.mask,
    required this.filter,
  });
}
