import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paw/components/feature/widget/track_widget.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../model/music_entity.dart';
import 'music_view.dart';

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  Future<List<Track>> getFavorites() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];
    List<Track> favorites = [];
    final snapShot = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(user.uid)
        .get();
    if (!snapShot.exists) {
      return [];
    }
    final data = snapShot.data()!;
    if (data['songs'] == null) {
      return [];
    }
    for (final track in data['songs']) {
      favorites.add(Track.fromJson(track));
    }
    return favorites;
  }

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
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getFavorites(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<Track> tracks = snapshot.data as List<Track>;
                      return ListView.builder(
                        itemCount: tracks.length,
                        itemBuilder: (context, index) {
                          return TrackWidget(track: tracks[index]);
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
