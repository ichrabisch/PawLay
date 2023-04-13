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
  MainApp({super.key});
  static String name = '';

  @override
  Widget build(BuildContext context) {
    List<dynamic>? data = [];
    data = ModalRoute.of(context)?.settings.arguments as List?;
    if (data != null) {
      name = data[0];
      print('mainde isim:' + name);
    } else {
      name = '';
    }
    return MaterialApp(
      localizationsDelegates:
          context.localizationDelegates, //desteklenen dillerin temsilcileri?
      supportedLocales: context.supportedLocales, //desteklenen diller
      locale: context.locale,
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginView(),
      },
      home: const HomePage(),
    );
  }
}
