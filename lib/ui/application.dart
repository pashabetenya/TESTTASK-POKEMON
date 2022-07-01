import 'package:application/ui/index.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const LoginPage(),
      navigatorKey: Get.key,
    );
  }
}
