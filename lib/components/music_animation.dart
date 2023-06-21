import 'package:flutter/material.dart';

class MusicVisualizer extends StatefulWidget {
  const MusicVisualizer({super.key});

  @override
  State<MusicVisualizer> createState() => _MusicVisualizerState();
}

class _MusicVisualizerState extends State<MusicVisualizer> {
  List<Color> colors = [
    const Color.fromARGB(255, 3, 92, 66),
    Colors.green,
    Colors.lightGreenAccent,
    Colors.green,
    const Color.fromARGB(255, 3, 92, 66),
  ];
  List<int> duration = [900, 700, 600, 800, 500];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
          78,
          (index) => MusicAnimation(
              duration: duration[index % 5], color: colors[index % 4])),
    );
  }
}

class MusicAnimation extends StatefulWidget {
  const MusicAnimation(
      {super.key, required this.duration, required this.color});
  final int duration;
  final Color color;

  @override
  State<MusicAnimation> createState() => _MusicAnimationState();
}

class _MusicAnimationState extends State<MusicAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);

    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5),
      ),
      height: animation.value,
    );
  }
}
