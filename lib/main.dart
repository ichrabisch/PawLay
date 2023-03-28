import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:paw/page/menu.dart';
import 'package:paw/page/classes/likes.dart';
import 'package:paw/page/classes/login.dart';
import 'package:paw/page/my_library.dart';
import 'package:paw/page/playlists.dart';
import 'package:paw/page/search.dart';
import 'package:paw/page/classes/shazam.dart';
import 'package:paw/page/classes/sign_up.dart';
import 'package:paw/page/classes/spotify.dart';
import 'package:paw/page/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

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
    User(),
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
