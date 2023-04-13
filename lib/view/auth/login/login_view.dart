import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paw/components/square_tile.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return TextFormField(
                    onChanged: (text) {
                      loginViewModel.saveUserName(text);
                    },
                    decoration: InputDecoration(
                      errorText: loginViewModel.userErrorMessage == ""
                          ? null
                          : loginViewModel.userErrorMessage,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: LocaleKeys.Username.tr(),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  );
                }),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return TextFormField(
                    onChanged: (text) {
                      loginViewModel.savePassword(text);
                    },
                    decoration: InputDecoration(
                        errorText: loginViewModel.passErrorMessage == ""
                            ? null
                            : loginViewModel.passErrorMessage,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: LocaleKeys.Password.tr()),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: true,
                  );
                }),
              ),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return ElevatedButton(
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
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Text(LocaleKeys.Continue.tr()),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: 'lib/images/google.png',
                  ),
                  SizedBox(width: 40),
                  SquareTile(
                    imagePath: 'lib/images/apple.png',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
