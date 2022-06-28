import 'package:application/ui/pages/detail/index.dart';

class DescriptionText extends StatelessWidget {
  final String height;
  final String weight;
  final String type;

  const DescriptionText({
    Key? key,
    required this.height,
    required this.weight,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: _buildingDescriptionText()),
      ],
    );
  }

  Widget _buildingDescriptionText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _typeText(),
        _lineBetwee(),
        _heightText(),
        _lineBetwee(),
        _weightText(),
      ],
    );
  }

  Widget _heightText() {
    return Column(
      children: <Widget>[
        _heightValue(),
        const SizedBox(height: 5.0),
        _heightTitle(),
      ],
    );
  }

  Widget _lineBetwee() {
    return Container(
      height: 50.0,
      width: 2.0,
      color: kReallyGrey,
    );
  }

  Widget _weightText() {
    return Column(
      children: <Widget>[
        _weightValue(),
        const SizedBox(height: 5.0),
        _weightTitle(),
      ],
    );
  }

  Widget _typeText() {
    return Column(
      children: <Widget>[
        _typeValue(),
        const SizedBox(height: 5.0),
        _typeTitle(),
      ],
    );
  }

  Widget _heightValue() {
    return Text(
      height.toUpperCase(),
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'CircularStd',
          fontSize: 21.0,
          color: kLightGrey),
    );
  }

  Widget _heightTitle() {
    return Text('HEIGHT',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Gotham',
          fontSize: 18.0,
          color: kReallyGrey.withOpacity(0.8),
        ));
  }

  Widget _weightValue() {
    return Text(
      weight.toUpperCase(),
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'CircularStd',
          fontSize: 21.0,
          color: kLightGrey),
    );
  }

  Widget _weightTitle() {
    return Text('WEIGHT',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Gotham',
          fontSize: 18.0,
          color: kReallyGrey.withOpacity(0.8),
        ));
  }

  Widget _typeValue() {
    return Text(
      type.toUpperCase(),
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'CircularStd',
          fontSize: 21.0,
          color: kLightGrey),
    );
  }

  Widget _typeTitle() {
    return Text('TYPE',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Gotham',
          fontSize: 18.0,
          color: kReallyGrey.withOpacity(0.8),
        ));
  }
}
