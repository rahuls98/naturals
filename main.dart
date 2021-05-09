import 'package:flutter/material.dart';
import 'package:naturals/constants.dart';
import 'package:naturals/screens/serviceScreen.dart';

void main() => runApp(Naturals());

class Naturals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData (
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: colorTextHighlight,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ServiceScreen()
    );
  }
}
