import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 92, 66),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 92, 66),
        elevation: 0,
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
      body: Center(
        child: Container(
          child: Text(
            LocaleKeys.Search.tr(),
            style: TextStyle(fontSize: 60, color: Colors.black),
          ),
        ),
      ));
}

//what is searchdelegate
class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Idea 10',
    'Experience',
    'Valse',
    'Yann Tiersen',
    'Vivaldi İstanbul\'da',
  ];
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
  Widget buildResults(BuildContext context) => Container(
        color: Color.fromARGB(255, 3, 92, 66),
        child: Center(
          //implemented buildResults
          child: Text(
            query,
            style: const TextStyle(fontSize: 64),
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    //implemented buildSuggestions
    List<String> suggestions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return Container(
      color: Color.fromARGB(255, 3, 92, 66),
      child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;
                showResults(context);
              },
            );
          }),
    );
  }
}
