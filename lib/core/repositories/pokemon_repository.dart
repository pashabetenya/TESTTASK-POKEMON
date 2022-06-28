import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:application/core/models/pokemon.dart';

class PokemonRepository {
  Future<List<Data>> fetchPokemon(String query) async {
    final response = await http.get(
      Uri.https(
        'raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json',
      ),
    );

    if (response.statusCode == 200) {
      final local = jsonDecode(response.body);

      final answer = local['pokemon'] as List;

      return answer.map((e) => Data.fromJson(e)).where((searching) {
        final title = searching.name.toLowerCase();
        final search = query.toLowerCase();

        return title.contains(search);
      }).toList();
    } else {
      throw Exception('Failed to load..');
    }
  }
}
