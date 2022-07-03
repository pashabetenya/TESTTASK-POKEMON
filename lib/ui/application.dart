import 'package:application/ui/index.dart';

class Application extends StatelessWidget {
  const Application({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Fluttertoast.showToast(
            msg: 'Something went wrong.',
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return MaterialApp(
          themeMode: ThemeMode.system,
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: const LoginPage(),
          navigatorKey: Get.key,
        );
      },
    );
  }
}
