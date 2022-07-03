import 'package:flutter/material.dart';

class BottomAuthPanel extends StatelessWidget {
  final Widget child;

  const BottomAuthPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 420.0,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            )),
        child: child,
      ),
    );
  }
}
