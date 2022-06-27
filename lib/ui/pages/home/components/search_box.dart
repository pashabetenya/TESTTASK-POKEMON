import 'package:application/ui/pages/home/index.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.2,
        child: Stack(
          children: <Widget>[
            _parametersBox(),
            _headerTextBox(),
            const Search(),
          ],
        ));
  }

  Widget _parametersBox() {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2 - 20.0,
      decoration: const BoxDecoration(
          color: kGreen,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35.0),
            bottomLeft: Radius.circular(35.0),
          )),
    );
  }

  Widget _headerTextBox() {
    return const TitleText(
        titleText1st: 'Welcome to the',
        titleText2nd: 'handbook!',
        description: 'Who are you looking for?');
  }
}
