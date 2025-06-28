import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/locator.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  final apiService = locator<ApiService>();
  CharactersModel? _charactersModel;

  CharactersModel? get charactersModel => _charactersModel;

  void getCharacters() async {
    _charactersModel = await apiService.getCharacters();
    notifyListeners();
  }

  bool loadMore = false;

  void getCharactersMore() async {
    if (loadMore || _charactersModel?.info.next == null) return;

    loadMore = true;
    notifyListeners();

    try {
      final data = await apiService.getCharacters(
        url: _charactersModel!.info.next,
      );

      _charactersModel!.info = data.info;
      _charactersModel!.characters.addAll(data.characters);
    } finally {
      loadMore = false;
      notifyListeners();
    }
  }

  void getCharactersByName(String? searchText) async {
    _charactersModel = null;
    notifyListeners();

    _charactersModel = await apiService.getCharacters(
      args: {'name': searchText},
    );
    notifyListeners();
  }
}
