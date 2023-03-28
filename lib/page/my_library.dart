import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: Center(
        child: Text(
          'Your Library',
          style: TextStyle(fontSize: 60, color: Colors.black),
        ),
      ));
}
