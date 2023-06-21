import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paw/view/data/get_values.dart';
import 'package:paw/view/musics/view/music_search_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/extention/build_extention.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String name = '';
  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('name') != null) {
      name = prefs.getString('name')!;
    } else {
      name = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          '${LocaleKeys.Welcome.tr()} $name',
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 30),
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
                    fontFamily: "Times New Roman",
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MusicSearchView(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: context.highValue,
                          height: context.highValue,
                          child: Center(
                            child: Image.asset(
                                'lib/images/vivaldiistanbulda.jpeg'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.highValue,
                        height: context.highValue,
                        child: Center(
                          child: Image.asset('lib/images/idea10.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.highValue,
                        height: context.highValue,
                        child: Center(
                          child: Image.asset('lib/images/valse.jpeg'),
                        ),
                      ),
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
                    fontFamily: "Times New Roman",
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.highValue,
                        height: context.highValue,
                        child: Center(
                          child: Image.asset('lib/images/rock.jpeg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.highValue,
                        height: context.highValue,
                        child: Center(
                          child: Image.asset('lib/images/classical.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.lowValue,
                child: const Text(
                  "Artists",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Times New Roman",
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.highValue,
                        height: context.highValue,
                        child: Center(
                          child: Image.asset('lib/images/vivaldi.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.highValue,
                        height: context.highValue,
                        child: Center(
                          child: Image.asset('lib/images/beethoven.jpeg'),
                        ),
                      ),
                    ),
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

class UserData {}
