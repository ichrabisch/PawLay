import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paw/core/enum/lang_enum.dart';
import 'package:paw/core/init/lang/language_manager.dart';
part 'setting_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
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
