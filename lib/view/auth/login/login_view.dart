import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/view/auth/login/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.pets, size: 80),
              const SizedBox(height: 30),
              Text(LocaleKeys.Username.tr()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    loginViewModel.saveUserName(text);
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.Username.tr(),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Text(LocaleKeys.Password.tr()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    loginViewModel.savePassword(text);
                  },
                  decoration:
                      InputDecoration(hintText: LocaleKeys.Password.tr()),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 247, 238, 203),
                ),
                onPressed: (() {
                  if (loginViewModel.buttonPassive) {
                    loginViewModel.buttonActive(context);
                  } else {
                    loginViewModel.buttonPassive = true;
                    null;
                  }
                }), //isButtonActive ? null :  check,
                child: Text(
                  LocaleKeys.LogIn.tr(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
