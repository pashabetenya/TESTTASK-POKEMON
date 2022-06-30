import 'package:application/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DrawClip extends StatelessWidget {
  const DrawClip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: DrawClipOne(),
            child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kGreen.withOpacity(0.5),
                      kGreen.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                )),
          ),
          ClipPath(
              clipper: DrawClipTwo(),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kGreen,
                      kGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class DrawClipOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(center: Offset(size.width, 65.0), radius: 200.0),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DrawClipTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(center: Offset(size.width * 0.2, 65.0), radius: 250.0),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
