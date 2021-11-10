import 'package:app_bloc_example/application/styles/colors_app.dart';
import 'package:flutter/material.dart';

abstract class ThemesApp {

  static ThemeData get primary => ThemeData(
    primaryColor: ColorsApp.primaryColor,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: ColorsApp.primaryColor,
      centerTitle: true
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.primaryColor
    ),
  ); 
}