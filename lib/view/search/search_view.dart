import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:paw/view/pages/shazam.dart';

import '../../components/square_tile.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 3, 92, 66),
            ),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                LocaleKeys.Search.tr(),
                style: const TextStyle(
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Times New Roman",
                    fontSize: 60),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Shazam();
              },
              backgroundColor: const Color.fromARGB(255, 3, 92, 66),
              child: const SquareTile(
                imagePath: 'lib/images/shazam.png',
              ),
            )
          ],
        ),
      ));
}

//what is searchdelegate
class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Vivaldi İstanbul\'da',
    'Experience',
    'Idea 10',
    'Valse',
    'Yann Tiersen',
  ];
  @override
  Widget? buildLeading(BuildContext context) {
    // implemented buildLeading
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null), //close searchbar
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // implemented buildActions
    IconButton(
      icon: const Icon(
        Icons.clear,
        color: Colors.black,
      ),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              //implemented buildResults
              child: Text(
                query,
                style: const TextStyle(
                    color: Color.fromARGB(255, 3, 92, 66),
                    fontFamily: "Times New Roman",
                    fontSize: 30),
              ),
            ),
            //image function
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/vivaldiistanbulda.jpeg'),
            ),
          ],
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 247, 238, 203),
          Color.fromARGB(255, 3, 92, 66),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
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
