import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paw/core/enum/lang_enum.dart';
import 'package:paw/core/init/lang/language_manager.dart';
part 'settings_viewmodel.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingsViewModel;

abstract class _SettingViewModelBase with Store {
  @observable
  String language = 'en';
  @action
  void setLanguage(String lng, BuildContext context) {
    if (lng == 'en') {
      LanguageManager.instance.changeLanguage(context, LanguageCodes.EN);
    } else if (lng == 'tr') {
      LanguageManager.instance.changeLanguage(context, LanguageCodes.TR);
    } else if (lng == 'es') {
      LanguageManager.instance.changeLanguage(context, LanguageCodes.ESP);
    }
    language = lng;
  }
}
