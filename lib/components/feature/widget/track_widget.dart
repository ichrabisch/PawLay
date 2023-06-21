import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw/view/musics/model/music_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrackWidget extends StatefulWidget {
  final Track track;

  const TrackWidget({
    super.key,
    required this.track,
  });

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  bool isFavorite = false;
  Future<void> addFavorite() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('favorites')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'songs': FieldValue.arrayUnion([
        {
          'title': widget.track.title,
          'genre': widget.track.genre,
          'artwork_url': widget.track.artworkUrl,
          'duration': widget.track.duration,
          'download_link': widget.track.downloadLink,
        }
      ])
    });
    setState(() {
      isFavorite = true;
    });
  }

  Future<void> removeFavorite() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('favorites')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'songs': FieldValue.arrayRemove([
        {
          'title': widget.track.title,
          'genre': widget.track.genre,
          'artwork_url': widget.track.artworkUrl,
          'duration': widget.track.duration,
          'download_link': widget.track.downloadLink,
        }
      ])
    });
    setState(() {
      isFavorite = false;
    });
  }

  @override
  void initState() {
    super.initState();
    inFavorite().then((value) => setState(() {
          isFavorite = value;
        }));
  }

  Future<bool> inFavorite() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return Future.value(false);
    }

    bool isDocExist = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => value.exists);
    if (!isDocExist) {
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'songs': []});
      return false;
    }

    var favorites = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => value.data()!['songs']);
    for (var favorite in favorites) {
      if (favorite['title'] == widget.track.title) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CachedNetworkImage(
              imageUrl: widget.track.artworkUrl ??
                  "https://teknoseyir.com/wp-content/uploads/2015/03/google-play-music-logo-250x250.jpg",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 75,
              height: 75,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  maxLines: 3,
                  softWrap: true,
                  widget.track.title ?? "Unknown",
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 20,
                  ),
                ),
                Text(widget.track.genre ?? "Unknown",
                    style: const TextStyle(
                      color: Colors.lightGreen,
                    ))
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              if (isFavorite) {
                removeFavorite();
              } else {
                addFavorite();
              }
            },
            icon: isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          )
        ],
      ),
    );
  }
}
