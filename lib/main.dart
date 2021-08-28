import 'package:calculator/screens/mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculator',
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData(primarySwatch: Colors.deepPurple),
    home: MainPage(),
  ));
}
