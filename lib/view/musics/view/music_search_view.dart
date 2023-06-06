import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paw/components/feature/widget/track_widget.dart';
import 'package:paw/components/music_animation.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:paw/view/musics/view/music_view.dart';
import 'package:paw/view/musics/viewmodel/music_search_model.dart';
import '../model/music_entity.dart';

class MusicSearchView extends StatefulWidget {
  const MusicSearchView({super.key});

  @override
  State<MusicSearchView> createState() => _MusicSearchViewState();
}

class _MusicSearchViewState extends State<MusicSearchView> {
  final musicSearchViewModel = MusicSearchViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          //tr funct comes from easy localization package
          LocaleKeys.Search.tr(),
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 36),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 3, 92, 66),
            ),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: MusicSearchDelegate(
                      musicSearchViewModel: musicSearchViewModel));
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Observer(builder: (_) {
                return Expanded(
                  child: FutureBuilder(
                    future: musicSearchViewModel.getTracks(
                        musicSearchViewModel.search, null),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Track> tracks = snapshot.data as List<Track>;
                        return ListView.builder(
                          itemCount: tracks.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                _navigateToNewPageWithArgument(context,
                                    tracks[index], musicSearchViewModel);
                              },
                              child: TrackWidget(
                                track: tracks[index],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: MusicVisualizer(),
                        );
                      }
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNewPageWithArgument(BuildContext context, Track track,
      MusicSearchViewModel musicSearchViewModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MusicView(
          track: track,
        ),
      ),
    );
  }
}

class MusicSearchDelegate extends SearchDelegate {
  final MusicSearchViewModel musicSearchViewModel;
  MusicSearchDelegate({required this.musicSearchViewModel});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Color.fromARGB(255, 3, 92, 66),
        ),
        onPressed: () {
          query = "";
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 3, 92, 66),
        ),
        onPressed: () {
          musicSearchViewModel.setSearch(query);
          close(context, null);
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 3, 92, 66),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 247, 238, 203),
          Color.fromARGB(255, 3, 92, 66),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}
