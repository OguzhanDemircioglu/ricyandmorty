import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/locator.dart';
import 'package:ricyandmorty/app/models/episode_model.dart';
import 'package:ricyandmorty/app/services/api_service.dart';

class CharacterDetailViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();
  List<EpisodeModel> _episodes = [];
  List<EpisodeModel> get episodes => _episodes;

  void getEpisodes(List<String> urlList) async {
    _episodes = await _apiService.getMultipleEpisodes(urlList);
    notifyListeners();
  }
}
