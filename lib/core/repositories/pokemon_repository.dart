import 'dart:async';
import 'dart:convert';

import 'package:application/core/database/hive_db/database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class PokemonRepository {
  final Dio _dio = Dio();
  final _baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future fetchPokemon() async {
    try {
      Response response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        final answer =
            (jsonDecode(response.data) as Map).cast<String, dynamic>();
        // ignore: avoid_print
        print('RESULT ANSWER: $answer');

        final result = (answer['pokemon'] as List).cast<Map>();
        // ignore: avoid_print
        print('RESULT: $result');

        return Database().cacheData(result);
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
