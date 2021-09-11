import 'package:example/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // primaryIconTheme: IconThemeData(color: Colors.blueAccent),
        // appBarTheme: AppBarTheme(
        //   color: Colors.blueAccent,
        //   iconTheme: IconThemeData(color: Colors.blueAccent),
        //   textTheme: TextTheme(
        //       headline6: TextStyle(
        //           // color: Colors.blueAccent,
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold),
        //       ),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(16)))),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(16)))),
        textTheme: TextTheme(
            caption: TextStyle(fontSize: 12),
            bodyText1: TextStyle(fontSize: 16),
            bodyText2: TextStyle(fontSize: 14)),
      );

  ThemeData get darkTheme {
    ThemeData _themeData = ThemeData.dark();
    return _themeData.copyWith(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(16),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.green),
          backgroundColor: MaterialStateProperty.all(Colors.green),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(16),
          ),
        ),
      ),
      textTheme: TextTheme(
        caption: TextStyle(fontSize: 12),
        bodyText1: TextStyle(fontSize: 16),
        bodyText2: TextStyle(fontSize: 14),
      ),
    );
  }

  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fotonica UI Components',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: Home(
        themeMode: themeMode,
        onChangeThemeMode: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
      ),
    );
  }
}
