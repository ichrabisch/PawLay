import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Text(
          'Search',
          style: TextStyle(fontSize: 60, color: Colors.black),
        ),
      ));
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    // implemented buildLeading
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null), //close searchbar
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // implemented buildActions
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null); //close searcbar
        } else {
          query = '';
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //implemented buildSuggestions
    List<String> suggestions = [
      'Idea 10',
      'Experience',
      'Valse',
      'Yann Tiersen',
      'Vivaldi İstanbul\'da',
    ];
  }
}
