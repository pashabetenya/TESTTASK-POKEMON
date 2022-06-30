import 'dart:async';
import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:application/core/models/pokemon.dart';

class PokemonRepository {
  Future<List<Data>> fetchPokemon(String query) async {
    final cache = await APICacheManager().isAPICacheKeyExist('data');

    if (!cache) {
      // This is the section that makes the request,
      // when you connect.

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

          final answer = local['pokemon'] as List;

          // This function is for making the search work.

          return answer.map((e) => Data.fromJson(e)).where((searching) {
            final title = searching.name.toLowerCase();
            final search = query.toLowerCase();

            return title.contains(search);
          }).toList();
        } else {
          throw Exception('Failed to load..');
        }
      } catch (e) {
        debugPrint('Error: ${e.toString()}');

        throw Exception('Failed to load..');
      }
    } else {
      // This is the section that handles the data,
      // that is in the cache provided there is no connection.

      try {
        final data = await APICacheManager().getCacheData('data');
        final answer = jsonDecode(data.syncData);

        final cache = answer['pokemon'] as List;

        // This function is for making the search work.

        return cache.map((e) => Data.fromJson(e)).where((searching) {
          final title = searching.name.toLowerCase();
          final search = query.toLowerCase();

          return title.contains(search);
        }).toList();
      } catch (e) {
        debugPrint('Error: ${e.toString()}');

        throw Exception('Failed to load..');
      }
    }
  }
}
