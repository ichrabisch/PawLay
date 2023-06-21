import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw/view/auth/auth_page.dart';
import 'package:paw/view/auth/login/loged_in_page.dart';

class AuthStateChanges extends StatelessWidget {
  const AuthStateChanges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //kullanıcı girdiyse
            return const LogedInPage();
          } else {
            //giriş yapma/ kaydolma ekranı
            return const AuthPage();
          }
        },
      ),
    );
  }
}
