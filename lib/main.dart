import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paw/core/init/lang/language_manager.dart';
import 'package:paw/firebase_options.dart';
import 'package:paw/view/auth/auth_page.dart';
import 'package:paw/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //başlangıçtan itibaren dil değiştirilebilmesini sağlar
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(EasyLocalization(
    supportedLocales: LanguageManager.instance.supportedLanguage,
    path: 'assets/lang',
    child: const MainApp(), //constant
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static String name = '';

  @override
  Widget build(BuildContext context) {
    List<dynamic>? data = [];
    data = ModalRoute.of(context)?.settings.arguments as List?;
    if (data != null) {
      name = data[0];
    } else {
      name = '';
    }
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      routes: {
        '/login': (context) => const AuthPage(),
      },
      home: const HomePage(),
    );
  }
}
