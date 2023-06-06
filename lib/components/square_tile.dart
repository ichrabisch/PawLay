import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 40,
    );
  }
}
