import 'package:application/ui/widgets/home/index.dart';

class TitleText extends StatelessWidget {
  final String titleText1st;
  final String titleText2nd;
  final String description;

  const TitleText({
    Key? key,
    required this.titleText1st,
    required this.titleText2nd,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: _buildTitleForm(),
        ));
  }

  Widget _buildTitleForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _titleTextOne(),
        _titleTextTwo(),
        const SizedBox(height: 10.0),
        _descriptionText(),
      ],
    );
  }

  Widget _titleTextOne() {
    return Text(titleText1st,
        style: const TextStyle(
          fontFamily: 'Gotham',
          fontSize: 31.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }

  Widget _titleTextTwo() {
    return Text(titleText2nd,
        style: const TextStyle(
          fontFamily: 'Gotham',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }

  Widget _descriptionText() {
    return Text(description,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w100,
          color: Colors.white,
        ));
  }
}
