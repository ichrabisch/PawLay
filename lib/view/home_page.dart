import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:paw/view/menu.dart';
import 'package:paw/view/my_library.dart';
import 'package:paw/view/playlists.dart';
import 'package:paw/view/search.dart';
import 'package:paw/view/setting/settings_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;
  final screens = [
    PlayLists(),
    Search(),
    Menu(),
    MyLibrary(),
    SettingView(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.my_library_music,
          size: 30, color: Color.fromARGB(255, 3, 92, 66)),
      Icon(Icons.search, size: 30, color: Color.fromARGB(255, 3, 92, 66)),
      Icon(Icons.headphones, size: 30, color: Color.fromARGB(255, 3, 92, 66)),
      Icon(Icons.my_library_music_outlined,
          size: 30, color: Color.fromARGB(255, 3, 92, 66)),
      Icon(Icons.person, size: 30, color: Color.fromARGB(255, 3, 92, 66)),
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: index,
        color: Color.fromARGB(255, 247, 238, 203),
        backgroundColor: Color.fromARGB(255, 3, 92, 66),
        items: items,
        onTap: (index) {
          setState(() => this.index = index);
        },
        animationCurve: Curves.elasticOut,
        animationDuration: Duration(milliseconds: 1500),
      ),
    );
  }
}
