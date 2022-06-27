import 'dart:async';
import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:application/core/models/pokemon.dart';

class PokemonRepository {
  Future<Pokemon> fetchPokemon() async {
    final cache = await APICacheManager().isAPICacheKeyExist('data');

    if (!cache) {
      try {
        final response = await http.get(
          Uri.https(
            'raw.githubusercontent.com',
            '/Biuni/PokemonGO-Pokedex/master/pokedex.json',
          ),
        );

        if (response.statusCode == 200) {
          final cacheDBModel = APICacheDBModel(
            key: 'data',
            syncData: response.body,
          );

          await APICacheManager().addCacheData(cacheDBModel);

          final local = jsonDecode(response.body);

          return Pokemon.fromJson(local);
        } else {
          throw Exception('Failed to load..');
        }
      } catch (e) {
        debugPrint('Error: ${e.toString()}');

        throw Exception('Failed to load..');
      }
    } else {
      try {
        final data = await APICacheManager().getCacheData('data');
        final answer = jsonDecode(data.syncData);

        return Pokemon.fromJson(answer);
      } catch (e) {
        debugPrint('Error: ${e.toString()}');

        throw Exception('Failed to load..');
      }
    }
  }
}
