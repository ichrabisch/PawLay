import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paw/core/enum/lang_enum.dart';
import 'package:paw/core/init/lang/language_manager.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //WidgetsFlutterBinding??
  await EasyLocalization
      .ensureInitialized(); //başlangıçtan itibaren dil değiştirilebilmesini sağlar
  runApp(EasyLocalization(
    child: MainApp(),
    supportedLocales: LanguageManager.instance.supportedLanguage,
    path: 'assets/lang', //constant
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:
          context.localizationDelegates, //desteklenen dillerin temsilcileri?
      supportedLocales: context.supportedLocales, //desteklenen diller
      locale: context.locale,
      home: ChangeLanguage(),
    );
  }
}

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  List<DropdownMenuItem<LanguageCodes>> get dropdownItems {
    List<DropdownMenuItem<LanguageCodes>> menuItems = [
      DropdownMenuItem(child: Text('English'), value: LanguageCodes.EN),
      DropdownMenuItem(child: Text('Türkçe'), value: LanguageCodes.TR),
      DropdownMenuItem(child: Text('Espanol'), value: LanguageCodes.ESP)
    ];
    return menuItems;
  }

  String seletedLanguage = LanguageCodes.EN.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Welcome.tr())),
      body: DropdownButton(
        value: seletedLanguage,
        onChanged: (String?),
        items: dropdownItems,
      ),
    );
  }
}
