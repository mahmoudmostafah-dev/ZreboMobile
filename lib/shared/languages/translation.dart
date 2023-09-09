import 'package:get/get.dart';

import 'LanguageName.dart';
import 'ar.dart';
import 'en.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LanguageName.en: en,
        LanguageName.ar: ar,
      };
}
