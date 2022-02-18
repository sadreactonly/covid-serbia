import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.blue),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColors.blue),
    ));

BoxDecoration appBackground = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/bg.png"),
    fit: BoxFit.cover,
  ),
);

