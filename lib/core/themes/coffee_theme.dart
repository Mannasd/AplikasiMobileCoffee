import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CoffeeTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryCoffee,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.darkCoffee,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.coffeeBrown,
        fontSize: 16,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.darkCoffee,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkCoffee,
      elevation: 0,
      centerTitle: true,
    ),
  );
}