import 'package:application/core/constants/constants.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 100.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: _buildTitleForm(),
      ),
    );
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
    return Text(
      titleText1st,
      style: const TextStyle(
        fontFamily: 'Gotham',
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _titleTextTwo() {
    return Text(
      titleText2nd,
      style: const TextStyle(
        fontFamily: 'Gotham',
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _descriptionText() {
    return Text(
      description,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w100,
        color: kReallyGrey.withOpacity(0.8),
      ),
    );
  }
}
