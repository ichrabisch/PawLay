// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_search_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicSearchViewModel on _MusicSearchViewModelBase, Store {
  late final _$searchAtom =
      Atom(name: '_MusicSearchViewModelBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$_MusicSearchViewModelBaseActionController =
      ActionController(name: '_MusicSearchViewModelBase', context: context);

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_MusicSearchViewModelBaseActionController
        .startAction(name: '_MusicSearchViewModelBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_MusicSearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search}
    ''';
  }
}
