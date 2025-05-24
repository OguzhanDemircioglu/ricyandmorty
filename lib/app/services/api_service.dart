import 'package:dio/dio.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters({String? url}) async {
    try {
      final response = await dio.get(url ?? '/character');

      if (response.statusCode == 200) {
        return CharactersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }
}
