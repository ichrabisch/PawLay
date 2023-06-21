import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paw/view/musics/model/music_entity.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import 'music_view.dart';

class DeviceMusicView extends StatefulWidget {
  const DeviceMusicView({super.key});

  @override
  State<DeviceMusicView> createState() => _DeviceMusicViewState();
}

class _DeviceMusicViewState extends State<DeviceMusicView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          'Device',
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
                  future: SongList.getSongsFromDownload(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No music found in your device',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index]['name']),
                            onTap: () {
                              Track track =
                                  Track(title: snapshot.data![index]['name']);
                              track.path = snapshot.data![index]['path'];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MusicView(
                                    track: track,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const Placeholder();
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

class SongList {
  static Future<List<Map<String, dynamic>>> getSongsFromDownload() async {
    List<Map<String, dynamic>> songMap = [];
    String? downloadPath = await getDownloadPath();

    if (downloadPath != null) {
      Directory directory = Directory(downloadPath);
      List<FileSystemEntity> files = directory.listSync(recursive: true);
      for (FileSystemEntity file in files) {
        if (file.path.endsWith('.mp3')) {
          Map<String, dynamic> song = {
            'name': file.path.split('/').last.split('.').first,
            'path': file.path,
          };
          songMap.add(song);
        }
      }
    }
    return songMap;
  }
}

Future<String?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      // ignore: avoid_slow_async_io

      directory = await getExternalStorageDirectory();
    }
  } catch (err, stack) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}
