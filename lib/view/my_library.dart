import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Text(
            LocaleKeys.Library.tr(),
            style: TextStyle(fontSize: 60, color: Colors.black),
          ),
        ),
      ));
}
