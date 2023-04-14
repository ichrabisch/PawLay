import 'package:flutter/material.dart';

class List extends StatelessWidget {
  List({super.key, required this.playlistName, required this.icon});
  final playlistName;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Color.fromARGB(255, 232, 224, 190),
      height: MediaQuery.of(context).size.height * 1 / 10,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(
            playlistName,
            style: const TextStyle(
                color: Color.fromARGB(255, 3, 92, 66),
                fontFamily: "Times New Roman",
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
