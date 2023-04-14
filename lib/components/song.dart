import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Song extends StatefulWidget {
  const Song({super.key});

  @override
  State<Song> createState() => _SongState();
}

class _SongState extends State<Song> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String toDigits(int n) => n.toString().padLeft(2, '0');
    final hours = toDigits(duration.inHours);
    final minutes = toDigits(duration.inMinutes.remainder(60));
    final seconds = toDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) {hours, minutes, seconds}
    ].join(':');
  }

  @override
  void initState() {
    super.initState();

    setAudio();

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });

      // Listen to audio duration
      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
        print(newDuration);
      });

      // Listen to audio position
      audioPlayer.onAudioPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    });
  }

  Future setAudio() async {
    // repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    //Load audio from assets
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('audio/vivaldi_istanbulda.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('lib/images/vivaldiistanbulda.jpeg'),
              ),
              const SizedBox(height: 32),
              const Text(
                "Vivaldi İstanbul'da",
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 92, 66),
                  fontFamily: "Times New Roman",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Can Atilla",
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 92, 66),
                  fontFamily: "Times New Roman",
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 4),
              CircleAvatar(
                radius: 35,
                backgroundColor: Color.fromARGB(255, 3, 92, 66),
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Color.fromARGB(255, 247, 238, 203),
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
              ),
              SizedBox(height: 4),
              Slider(
                min: 0,
                max: position.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                thumbColor: Colors.white,
                activeColor: Colors.white,
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  // play audio if was paused
                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
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
