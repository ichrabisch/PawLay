import 'package:dio/dio.dart';
import 'package:paw/core/constants/url.dart';
import 'package:paw/view/musics/service/download_link.dart';

import '../model/music_entity.dart';

//TODO şarkı indirme(dızlama) ,indirilen şarkıyı uygulamanın dosya yolunca saklama

//TODO shazam api denenecek

class MusicSearchService {
  final Dio dio = Dio();
  // ignore: constant_identifier_names
  static const List<String> _TrackFields = [
    "artwork_url",
    "genre",
    "title",
    "duration",
    "download_link",
  ];
  Future<List<Track>> getTracks(String trackName, int? limit) async {
    try {
      final response = await dio.get(SoundCloud.tracksURL, queryParameters: {
        "q": trackName,
        "client_id": SoundCloud.clientID,
        "limit": limit == null ? "10" : limit.toString()
      });
      List<dynamic> collectionOfTracks = response.data["collection"];
      List<Track> tracks = [];
      for (var track in collectionOfTracks) {
        Map<String, dynamic> trackMap = {};
        for (String field in _TrackFields) {
          if (field != "download_link") {
            trackMap[field] = track[field];
          } else {
            trackMap[field] =
                await getSoundCloudDownloadLink(track["permalink_url"]);
          }
        }
        tracks.add(Track.fromJson(trackMap));
      }
      return tracks;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
