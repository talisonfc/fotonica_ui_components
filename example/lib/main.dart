import 'package:example/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fotonica UI Components',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)))),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)))),
          textTheme: TextTheme(
              caption: TextStyle(fontSize: 12),
              bodyText1: TextStyle(fontSize: 16),
              bodyText2: TextStyle(fontSize: 14))),
      home: Home(),
    );
  }
}
