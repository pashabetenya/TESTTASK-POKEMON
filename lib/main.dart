import 'package:application/core/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  runApp(
    const Application(),
  );
}
