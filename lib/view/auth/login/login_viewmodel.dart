import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paw/view/auth/login/users.dart';
import 'package:paw/view/user.dart';
import '../../../main.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  String userName = '';
  @observable
  String password = '';
  @observable
  var data = [];
  @observable
  String passErrorMessage = '';
  @observable
  String userErrorMessage = '';
  @observable
  String invalidErrorMessage = '';
  @action
  void check(BuildContext context, String userName, String password) {
    if (Users.users[userName] != null) {
      // burada kayıtlı olup olmadıkları kontrol edilecek
      if (Users.users[userName] == password) {
        data.add(userName);
        data.add(password);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainApp(),
            settings: RouteSettings(arguments: data),
          ),
        );
        buttonPassive = true;
        print(data);
      } else {
        passErrorMessage = "Wrong Password!";
        buttonPassive = true;
      }
    } else {
      //kayıtlı değilse uyarı mesajı
      userErrorMessage = "User is not registered!";
      buttonPassive = true;
    }
  }

  @action
  void saveUserName(String text) {
    userName = text;
  }

  @action
  void savePassword(String text) {
    password = text;
  }

  @observable
  bool buttonPassive = true;
  @action
  void buttonActive(BuildContext context) {
    if ((userName.length > 16) ||
        (userName.length < 4) ||
        (password.length > 16) ||
        (password.length < 4)) {
      //invalid uyarısı
      invalidErrorMessage = "Invalid";
      final snackBar = SnackBar(
          content: Text(
        invalidErrorMessage,
        style: TextStyle(fontSize: 20),
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      buttonPassive = false;
    } else {
      check(context, userName, password);
    }
  }
}
