// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'navigations/tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
  }
 
  class _MyAppState extends State<MyApp> {
  @override
  Widget build(Object context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
        )
      ),
      home: Tabbar(),
    );
  }
}
