import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paw/main.dart';
import '../core/extention/build_extention.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

class Menu extends StatelessWidget {
  String name = '';

  @override
  Widget build(BuildContext context) {
    name = MainApp.name;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          LocaleKeys.Welcome.tr() + ' ' + name,
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 36),
        ),
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
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              SizedBox(
                height: context.lowValue,
                child: Text(
                  LocaleKeys.Recommend.tr(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Time New Roman",
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: context.highValue,
                color: Colors.transparent,
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
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Time New Roman",
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: context.highValue,
                color: Colors.transparent,
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
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Time New Roman",
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: context.highValue,
                color: Colors.transparent,
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
        ),
      ),
    );
  }
}
