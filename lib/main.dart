import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paw/core/init/lang/language_manager.dart';
import 'package:paw/view/auth/login/login_view.dart';
import 'package:paw/view/home_page.dart';

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
      initialRoute: '/',
      routes: {
        'login': (context) => LoginView(),
      },
      home: const HomePage(),
    );
  }
}
