import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const new({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/logo.png'),
      width: width,
      height: height,
    );
  }
}
