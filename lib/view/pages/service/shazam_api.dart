import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ShazamAPI {
  static Future<String> getSongName() async {
    var dio = Dio();
    Options options = Options(headers: {
      'X-RapidAPI-Key': '4448a50720msh197754f2411f706p1cc1d1jsnb0a475b402ff',
      'X-RapidAPI-Host': 'shazam-core7.p.rapidapi.com'
    });
    Directory? directory = await getApplicationDocumentsDirectory();
    String path = directory!.path + '/recorded.aac';
    var file = File(path);
    Uint8List bytes = file.readAsBytesSync();

    FormData formData = FormData.fromMap(
        {'audio': MultipartFile.fromBytes(bytes, filename: 'recorded.wav')});
    var response = await dio.post(
        'https://shazam-core7.p.rapidapi.com/songs/recognize-song',
        data: formData,
        options: options);
    if (response.statusCode == 200) {
      print(response);
      return response.toString();
    } else {
      return 'error';
    }
  }
}
