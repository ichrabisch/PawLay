import 'package:flutter/material.dart';
import 'package:paw/components/list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:paw/view/pages/likes.dart';

class PlayLists extends StatelessWidget {
  PlayLists({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          LocaleKeys.Playlists.tr(),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => print("deneme"),
                  child: List(playlistName: LocaleKeys.Favourites.tr()),
                ),
                SizedBox(height: 30),
                List(
                  playlistName: "Classic",
                ),
              ],
            ),
          ),
        ),
      ));
}
