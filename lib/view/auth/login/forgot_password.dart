import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(LocaleKeys.LinkSent.tr()),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(LocaleKeys.Resetpass.tr(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              LocaleKeys.EnterMail.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 238, 203),
                  border: Border.all(
                      color: const Color.fromARGB(255, 247, 238, 203)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'e-mail',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: passwordReset,
              color: const Color.fromARGB(255, 3, 92, 66),
              child: Text(
                LocaleKeys.Resetpass.tr(),
                style:
                    const TextStyle(color: Color.fromARGB(255, 247, 238, 203)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
