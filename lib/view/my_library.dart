// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:paw/view/pages/likes.dart';
import 'package:paw/components/list.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          LocaleKeys.Library.tr(),
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 36),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  List(
                    playlistName: "Classical Violin",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Piano Song",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Yellow",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Classic",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Sway",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Runaway",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Numb",
                    icon: Icon(Icons.music_note),
                  ),
                  const SizedBox(height: 20),
                  List(
                    playlistName: "Sweather Weather",
                    icon: Icon(Icons.music_note),
                  ),
                ],
              ),
            ),
          ),
          /* child: Text(
            LocaleKeys.Library.tr(),
            style: TextStyle(fontSize: 60, color: Colors.black),
          ),*/
        ),
      ));
}
