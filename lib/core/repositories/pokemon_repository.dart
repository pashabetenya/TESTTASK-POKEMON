import 'dart:async';
import 'dart:convert';

import 'package:application/core/models/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class PokemonRepository {
  final Dio _dio = Dio();
  final _baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<List<Data>> fetchPokemon(String query) async {
    try {
      Response response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        final answer = jsonDecode(response.data);

        final cache = answer['pokemon'] as List;

        return cache.map((e) => Data.fromJson(e)).where((searching) {
          final title = searching.name.toLowerCase();
          final search = query.toLowerCase();

          return title.contains(search);
        }).toList();
      } else {
        throw Exception('Failed to load..');
      }
    } on DioError catch (e) {
      debugPrint('Dio error!');

      if (e.response != null) {
        debugPrint('Status: ${e.response?.statusCode}');
      } else {
        debugPrint('Error sending request!');
        debugPrint('Error: ${e.toString()}');
      }

      throw Exception('Failed to load..');
    }
  }
}
