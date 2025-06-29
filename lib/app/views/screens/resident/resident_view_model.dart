import 'package:flutter/cupertino.dart';
import 'package:ricyandmorty/app/locator.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/services/api_service.dart';

class ResidentViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  List<CharacterModel> _residents = [];
  List<CharacterModel> get residents => _residents;

  void getResidents(List residentsUrlList) async {
    _residents = await _apiService.getCharactersFromUrlList(
      residentsUrlList.map((e) => e.toString()).toList(),
    );
    notifyListeners();
  }
}
