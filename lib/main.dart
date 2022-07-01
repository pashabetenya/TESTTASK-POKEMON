import 'package:application/core/services/dependency_service.dart';
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
  DependencyService.registerDependencyService();

  runApp(const Application());
}
