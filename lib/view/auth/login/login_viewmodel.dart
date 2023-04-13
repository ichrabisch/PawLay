import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paw/view/auth/login/login_view.dart';
import 'package:paw/view/menu.dart';
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
  @action
  void check(BuildContext context) {
    if ((userName.length <= 16) || password.length <= 16) {
      // burada kayıtlı olup olmadıkları kontrol edilecek
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
      //kayıtlı değilse uyarı mesajı
      Navigator.pushNamed(context, '/login');
      buttonPassive = false;
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
      buttonPassive = true;
    } else {
      check(context);
    }
  }
}
