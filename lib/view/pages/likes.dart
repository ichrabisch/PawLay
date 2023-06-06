import 'package:flutter/material.dart';
import 'package:paw/components/list.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/view/musics/view/music_search_view.dart';

class Likes extends StatelessWidget {
  const Likes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          LocaleKeys.Favourites.tr(),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MusicSearchView(),
                      ),
                    );
                  },
                  child: const List(
                    playlistName: 'Vivaldi İstanbul\'da',
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),
                const List(
                  playlistName: 'Idea 10',
                  icon: Icon(Icons.favorite),
                ),
                const SizedBox(height: 20),
                const List(
                  playlistName: 'Valse',
                  icon: Icon(Icons.favorite),
                ),
                const SizedBox(height: 20),
                const List(
                  playlistName: 'Experience',
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
