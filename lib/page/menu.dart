import 'package:flutter/material.dart';
import 'build_extention.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome, Fatih",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 238, 203),
              fontFamily: "Times New Roman",
              fontSize: 36),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 3, 92, 66),
      ),
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(
              height: context.lowValue,
              child: Text(
                "RECOMMENDED FOR YOU",
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 238, 203),
                  fontFamily: "Time New Roman",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: context.highValue,
              color: Colors.amber[600],
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: Center(child: Text("Trial Music 1")),
                  ),
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: Center(child: Text("Trial Music 2")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.lowValue,
              child: Text(
                "GENRE",
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 238, 203),
                  fontFamily: "Time New Roman",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: context.highValue,
              color: Colors.amber[500],
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: Center(child: Text("Trial 1")),
                  ),
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: Center(child: Text("Trial 2")),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.lowValue,
              child: Text(
                "Classic",
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 238, 203),
                  fontFamily: "Time New Roman",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: context.highValue,
              color: Colors.amber[100],
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: Center(child: Text("Beethoven")),
                  ),
                  SizedBox(
                    width: context.highValue,
                    height: context.highValue,
                    child: Center(child: Text("Vivaldi")),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}
