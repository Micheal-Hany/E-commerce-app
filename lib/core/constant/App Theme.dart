import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Ciaro",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.primaryColorDart),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppColor.primaryColorDart),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.primaryColorDart,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium:
          TextStyle(height: 2, color: AppColor.primaryColorDart, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Ciaro",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      bodyLarge:
          TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 14),
      bodyMedium: TextStyle(height: 2, fontSize: 14)),
  primarySwatch: Colors.blue,
);
