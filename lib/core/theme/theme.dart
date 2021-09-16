
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 24.0,),
        primary: Colors.white,
        backgroundColor: Colors.blueAccent,
      )
    )
  );
}