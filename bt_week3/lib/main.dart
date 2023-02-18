// import 'package:bt_week3/pages/mainScreen.dart';
import 'package:bt_week3/pages/welcomScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(bt_week3());
}

class bt_week3 extends StatelessWidget {
  const bt_week3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomeScreen(),
    );
  }
}
