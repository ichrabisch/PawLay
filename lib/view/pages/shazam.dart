// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paw/view/pages/service/shazam_api.dart';
import 'package:record/record.dart';

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
      String path = '${directory!.path}/recorded.aac';

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
              title: const Text("Shazam"),
              content: Column(children: [
                Image.network(songMap['track']['images']['coverart']),
                Text("Song Name: " + songMap['track']['title']),
                Text("Artist Name: " + songMap['track']['subtitle']),
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("close"))
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
              title: const Text("Shazam"),
              content: Column(children: const [
                Text("No song found"),
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("close"))
              ],
            );
          });
    }
  }

  final record = Record();
  List<Color> colorList = [
    const Color.fromARGB(255, 3, 92, 66),
    Colors.green,
    Colors.lightGreenAccent,
    Colors.green,
    const Color.fromARGB(255, 3, 92, 66),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = const Color.fromARGB(255, 3, 92, 66);
  Color topColor = Colors.green;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Shazam',
          style: TextStyle(
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
              });
            },
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              onPressed: () {
                //start to listen song
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
                backgroundColor: Colors.transparent,
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
