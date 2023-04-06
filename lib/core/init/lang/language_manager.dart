import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paw/core/enum/lang_enum.dart';

class LanguageManager {
  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    if (_instance == null) {
      _instance = LanguageManager._init();
    }
    return _instance!;
  }

  Locale get enLocale => const Locale('en', 'US');
  Locale get trLocale => const Locale('tr', 'TR');
  Locale get esLocale => const Locale('es', 'ESP');
  List<Locale> get supportedLanguage => [enLocale, trLocale, esLocale];
  // we created a list for using in main funcion

  void changeLanguage(BuildContext context, LanguageCodes languageCodes) {
    context.setLocale(getLocale(languageCodes));
  }

  Locale getLocale(LanguageCodes languageCodes) {
    switch (languageCodes) {
      case LanguageCodes.EN:
        return enLocale;
      case LanguageCodes.TR:
        return trLocale;
      case LanguageCodes.ESP:
        return esLocale;
      default:
        return enLocale;
    }
  }
}
