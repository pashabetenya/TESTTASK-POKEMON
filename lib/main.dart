import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application/ui/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const Application());
}
