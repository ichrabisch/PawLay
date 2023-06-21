import 'package:mobx/mobx.dart';

import '../model/music_entity.dart';
import '../service/music_service.dart';
part 'music_search_model.g.dart';

// ignore: library_private_types_in_public_api
class MusicSearchViewModel = _MusicSearchViewModelBase
    with _$MusicSearchViewModel;

abstract class _MusicSearchViewModelBase with Store {
  @observable
  String search = '';
  @action
  void setSearch(String value) => search = value;
  Future<List<Track>> getTracks(String search, int? limit) {
    if (search == "") {
      return Future.value([]);
    } else {
      return MusicSearchService().getTracks(search, limit ?? 10);
    }
  }
}
