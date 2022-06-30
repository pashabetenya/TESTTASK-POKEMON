import 'package:application/core/constants/constants.dart';
import 'package:flutter/material.dart';

class QuestionPanel extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String description;

  const QuestionPanel({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(description),
        const SizedBox(width: 5.0),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(color: kGreen),
          ),
        ),
      ],
    );
  }
}
