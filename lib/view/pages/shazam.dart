import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paw/view/pages/service/shazam_api.dart';
import 'package:record/record.dart';
import '../../core/init/lang/locale_keys.g.dart';

class Shazam extends StatefulWidget {
  const Shazam({super.key});

  @override
  State<Shazam> createState() => _ShazamState();
}

class _ShazamState extends State<Shazam> {
  bool _isRecording = false;

  void startRecod() async {
    if (await record.hasPermission()) {
      Directory? directory = await getApplicationDocumentsDirectory();
      String path = directory!.path + '/recorded.aac';

      await record.start(path: path);
      setState(() {
        _isRecording = true;
      });
    }
  }

  void stopRecord() async {
    await record.stop();

    var songName = await ShazamAPI.getSongName();
    if (songName != 'error') {
      Map<String, dynamic> songMap = jsonDecode(songName);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Shazam"),
              content: Column(children: [
                Container(
                  child: Image.network(songMap['track']['images']['coverart']),
                ),
                Text("Song Name: " + songMap['track']['title']),
                Text("Artist Name: " + songMap['track']['subtitle']),
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("close"))
              ],
            );
          });

      setState(() {
        _isRecording = false;
      });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Shazam"),
              content: Column(children: [
                Text("No song found"),
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("close"))
              ],
            );
          });
    }
  }

  final record = Record();
  List<Color> colorList = [
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.blue,
    Colors.blueAccent,
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.blueAccent;
  Color topColor = Colors.blue;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          'Shazam',
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: AnimatedContainer(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                    begin: begin, end: end, colors: [bottomColor, topColor])),
            onEnd: () {
              setState(() {
                index = index + 1;
                // animate the color
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];

                //// animate the alignment
                // begin = alignmentList[index % alignmentList.length];
                // end = alignmentList[(index + 2) % alignmentList.length];
              });
            },
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              onPressed: () {
                //start to listen song and animate
                setState(() {
                  _isRecording = !_isRecording;
                });
                if (_isRecording) {
                  startRecod();
                } else {
                  stopRecord();
                }
              },
              child: Text(
                _isRecording ? 'stop listening' : 'start listening',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
