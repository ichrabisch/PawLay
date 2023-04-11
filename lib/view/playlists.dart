import 'package:flutter/material.dart';

class PlayLists extends StatelessWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: Center(
        child: Text(
          'Play Lists',
          style: TextStyle(fontSize: 60, color: Colors.black),
        ),
      ));
}
