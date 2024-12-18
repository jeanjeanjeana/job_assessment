import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  final String baseUrl = "https://rickandmortyapi.com/api";

  /*Future<Map<String, dynamic>> fetchCharacters({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/character?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {
        'results': (data['results'] as List)
            .map((json) => Character.fromJson(json))
            .toList(),
        'info': data['info'], // Pagination info
      };
    } else {
      throw Exception('Failed to load characters');
    }
  }*/

  Future<Character> fetchAllCharacters({int page = 1}) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));

    if (response.statusCode == 200) {
      return Character.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Character> fetchAllCharactersBySpecies({int page = 1}) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page&species=Human'));

    if (response.statusCode == 200) {
      return Character.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
