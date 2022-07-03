import 'package:application/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color = kGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 51.0,
      minWidth: double.maxFinite,
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
