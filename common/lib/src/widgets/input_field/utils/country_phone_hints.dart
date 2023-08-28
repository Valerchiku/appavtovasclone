import 'package:country_code_picker/country_code_picker.dart';

extension CountryPhoneHints on CountryCode {
  String phoneHint() => switch (dialCode) {
        '+7' => '(XXX) XXX-XX-XX',
        '+375' => '(XX) XXX-XX-XX',
        '+380' => '(XXX) XXXXXX',
        '+994' => '(XX) XX-XX-XX',
        '+996' => '(XXX) XXX-XX-XX',
        '+993' => '(XX) XX-XX-XX',
        '+992' => '(XX) XXX-XX-XX',
        '+998' => '(XX) XXX-XX-XX',
        '+374' => '(XX) XXX-XXX',
        _ => 'XXXXXXXXXX',
      };
}
