import 'package:common/src/localization/flutter_gen/avtovas_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationsExt on BuildContext {
  AvtovasLocalization get locale => AvtovasLocalization.of(this);
}
