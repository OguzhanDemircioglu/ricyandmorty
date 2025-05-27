import 'package:dio/dio.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/models/episode_model.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters({
    String? url,
    Map<String, dynamic>? args,
  }) async {
    try {
      final response = await dio.get(
        url ?? '/character',
        queryParameters: args,
      );

      if (response.statusCode == 200) {
        return CharactersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }

  Future<List<Character>> getMultipleCharacters(List<int> idList) async {
    try {
      final response = await dio.get('/character/${idList.join(",")}');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Character.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }

  Future<List<EpisodeModel>> getMultipleEpisodes(List<String> idList) async {
    try {
      final List<String> episodeNumbers =
          idList.map((e) => e.split('/').last).toList();

      final response = await dio.get('/episode/${episodeNumbers.join(",")}');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => EpisodeModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load Episodes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Episodes: $e');
    }
  }
}
