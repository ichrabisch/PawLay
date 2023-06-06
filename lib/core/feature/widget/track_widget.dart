import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw/view/musics/model/music_entity.dart';

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
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
