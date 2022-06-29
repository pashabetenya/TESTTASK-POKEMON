import 'package:application/core/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:application/ui/application.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  await Hive.initFlutter();
  Hive.registerAdapter(
    DataAdapter(),
  );
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox<Data>('data_db');

  runApp(
    const Application(),
  );
}
