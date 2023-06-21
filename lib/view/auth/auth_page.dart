import 'package:flutter/material.dart';
import 'package:paw/view/auth/login/login_view.dart';
import 'package:paw/view/auth/register/sign_up_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially, show the login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginView(showRegisterPage: toggleScreens);
    } else {
      return SignUpView(showLoginPage: toggleScreens);
    }
  }
}
