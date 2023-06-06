import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class LogedInPage extends StatefulWidget {
  const LogedInPage({super.key});

  @override
  State<LogedInPage> createState() => _LogedInPageState();
}

class _LogedInPageState extends State<LogedInPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(LocaleKeys.LogIn.tr(),
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 36,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
            children: [
              Text(
                LocaleKeys.SignedIn.tr() + user.email!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 3, 92, 66),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: const Color.fromARGB(255, 3, 92, 66),
                child: Text(
                  LocaleKeys.SignOut.tr(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 247, 238, 203),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
