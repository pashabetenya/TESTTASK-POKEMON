import 'package:application/ui/pages/home/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreen,
        elevation: 0.00,
        actions: [
          _shareButton(),
        ],
      ),
      body: Column(
        children: const <Widget>[
          SearchBox(),
          ViewPokemon(),
        ],
      ),
    );
  }

  Widget _shareButton() {
    return IconButton(
      color: kReallyGrey,
      icon: const Icon(Icons.share),
      onPressed: () {
        // share page.
      },
      iconSize: 30.0,
    );
  }
}
