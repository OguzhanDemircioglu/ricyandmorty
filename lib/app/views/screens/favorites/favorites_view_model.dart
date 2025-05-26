import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/locator.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/services/api_service.dart';
import 'package:ricyandmorty/app/services/preferences_service.dart';

class FavoritesViewModel extends ChangeNotifier {
  final _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();
  List<int> _favorites = [];
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  void getFavorites() {
    _favorites = _preferencesService.getCharactersFromCache();
    _getCharacters();
  }

  void _getCharacters() async {
    _characters = await _apiService.getMultipleCharacters(_favorites);
    notifyListeners();
  }
}
