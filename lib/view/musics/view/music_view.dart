import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paw/components/music_animation.dart';
import 'package:paw/view/musics/model/music_entity.dart';

// ignore: must_be_immutable
class MusicView extends StatefulWidget {
  Track track;

  MusicView({super.key, required this.track});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool firstTime = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Duration maxDuration = Duration.zero;

  String formatTime(Duration duration) {
    String toDigits(int n) => n.toString().padLeft(2, '0');
    final hours = toDigits(duration.inHours);
    final minutes = toDigits(duration.inMinutes.remainder(60));
    final seconds = toDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours >= 0) {hours, minutes, seconds}
    ].join(':');
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    setAudio();

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });

      // Listen to audio duration
      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
          if (firstTime) {
            maxDuration = newDuration;
            firstTime = false;
          }
        });
      });

      // Listen to audio position
      audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    });
  }

  Future setAudio() async {
    // repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    // play audio
    audioPlayer.setSourceUrl(widget.track.downloadLink!);
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
        child: Container(
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
                  child: Image.network(
                    widget.track.artworkUrl!,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  widget.track.title!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Times New Roman",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.track.genre!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Times New Roman",
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color.fromARGB(255, 3, 92, 66),
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: const Color.fromARGB(255, 247, 238, 203),
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
                const SizedBox(height: 4),
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble() == 0
                      ? const Duration(minutes: 1).inSeconds.toDouble()
                      : duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  thumbColor: const Color.fromARGB(255, 247, 238, 203),
                  activeColor: const Color.fromARGB(255, 247, 238, 203),
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
                      Text(formatTime(position).toString()),
                      Text(formatTime(duration - position).toString()),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    child: MusicVisualizer(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
