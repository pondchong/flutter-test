import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("logo build");
    return Image.asset(
      'assets/images/line.png',
      height: 35,
      fit: BoxFit.cover,
    );
  }
}
