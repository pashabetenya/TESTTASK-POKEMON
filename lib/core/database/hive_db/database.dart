import 'package:application/core/models/pokemon.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  late Box<Data> _data;

  // Save pokemon to Hive-box (hive-db).
  Future<void> saveData(Data data) async {
    _data = await Hive.openBox<Data>('data_db');
    _data.put('pokemon', data);
  }

  // Get data from Hive-box (data-db).
  Future<Data?> getData() async {
    _data = await Hive.openBox<Data>('data_db');
    return _data.get('pokemon');
  }

  Future<void> cacheData(List<Map> cacheData) async {
    for (var dataDynamic in cacheData) {
      final data = Data(
        id: dataDynamic['id'] as int,
        name: dataDynamic['name'] as String,
        img: dataDynamic['img'] as String,
        type: (dataDynamic['type'] as List<dynamic>).cast<String>(),
        height: dataDynamic['height'] as String,
        weight: dataDynamic['weight'] as String,
      );
      saveData(data);
    }
  }

  Future<void> clear() async {
    await Hive.box<Data>('data_db').clear();
  }
}
