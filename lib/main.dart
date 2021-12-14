//Contains widgets
import 'package:flutter/material.dart';
import '/screens/bmi_screen.dart';
import '/screens/intro_screen.dart';

//Will not run without main
void main() {
  runApp(GlobeApp());
}

//stless is short hand to create a new class
//Extend creates a subclass
//Stateless widget never changes during its life
class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
      },
      initialRoute: '/',
      // home: IntroScreen());
    );
  }
}

//Child allows you to nest inside widget