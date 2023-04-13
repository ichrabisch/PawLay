import 'package:flutter/material.dart';
import 'package:paw/main.dart';

class List extends StatelessWidget {
  List({super.key, required this.playlistName});
  final playlistName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Color.fromARGB(255, 232, 224, 190),
        height: MediaQuery.of(context).size.height * 1 / 10,
        child: Row(
          children: [
            Icon(Icons.my_library_music),
            SizedBox(
              width: 10,
            ),
            Text(playlistName),
          ],
        ),
      ),
    );
  }
}
