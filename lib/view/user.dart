import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: Center(
        child: Text(
          'Person',
          style: TextStyle(fontSize: 60, color: Colors.black),
        ),
      ));
}
