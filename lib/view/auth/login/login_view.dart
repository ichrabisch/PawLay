import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String userName = "";
  String password = "";
  static var data = [];

  void check() {
    if ((userName.length < 16) || (password.length < 16)) {
      data.add(userName);
      data.add(password);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainApp(),
            settings: RouteSettings(arguments: data),
          ));
    } else {}
  }

  void _saveUser(String text) {
    setState(() {
      userName = text;
    });
  }

  void _savePassword(String text) {
    setState(() {
      password = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonActive = true;
    if (((userName.length > 16) || (userName.length < 4)) ||
        ((password.length > 16) || (password.length < 4))) {
      isButtonActive = true;
    } else {
      isButtonActive = false;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(LocaleKeys.Username.tr()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  _saveUser(text);
                },
                decoration: InputDecoration(hintText: LocaleKeys.Username.tr()),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
            ),
            Text(LocaleKeys.Password.tr()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  _savePassword(text);
                },
                decoration: InputDecoration(hintText: LocaleKeys.Password.tr()),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 92, 66),
              ),
              onPressed: isButtonActive ? null : check,
              child: Text(LocaleKeys.LogIn.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
