import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../core/extention/build_extention.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:paw/view/auth/login/login_view.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          LocaleKeys.Welcome.tr() + "Fatih",
          style: const TextStyle(
              color: Color.fromARGB(255, 247, 238, 203),
              fontFamily: "Times New Roman",
              fontSize: 36),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 3, 92, 66),
      ),
      backgroundColor: const Color.fromARGB(255, 3, 92, 66),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(
              height: context.lowValue,
              child: Text(
                LocaleKeys.Recommend.tr(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 247, 238, 203),
                  fontFamily: "Time New Roman",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: context.highValue,
              color: const Color.fromARGB(255, 142, 144, 142),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: const Center(child: Text("Trial Music 1")),
                  ),
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: const Center(child: Text("Trial Music 2")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.lowValue,
              child: Text(
                LocaleKeys.Genre.tr(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 247, 238, 203),
                  fontFamily: "Time New Roman",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: context.highValue,
              color: const Color.fromARGB(255, 142, 144, 142),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: const Center(child: Text("Trial 1")),
                  ),
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: const Center(child: Text("Trial 2")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.lowValue,
              child: const Text(
                "Classic",
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 238, 203),
                  fontFamily: "Time New Roman",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: context.highValue,
              color: const Color.fromARGB(255, 142, 144, 142),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: const Center(child: Text("Beethoven")),
                  ),
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: const Center(child: Text("Vivaldi")),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}
