import 'package:flutter/material.dart';
import 'package:Auto_Shop/core/utils/constants.dart';

class TextThemeConstants {
  static final lightTextTheme = TextTheme(
      headlineLarge: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
          fontFamily: "RobotoSlab",
          color: Colors.black87),
      headlineMedium: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
          fontFamily: "RobotoSlab",
          color: Constants.primaryColor),
      headlineSmall: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Constants.primaryColor),
      bodyLarge: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: "RobotoSlab",
      ),
      bodySmall: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFamily: "ProtestRiot-Regular",
      ),
      labelLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Constants.secondaryColor),
      labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constants.secondaryColor),
      labelSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constants.secondaryColor),
      displayLarge: const TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      displaySmall: const TextStyle(fontSize: 15, color: Colors.black));

  static final darkTextTheme = TextTheme(
      headlineLarge: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
          fontFamily: "RobotoSlab",
          color: Constants.darkTextColor),
      headlineMedium: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
          fontFamily: "RobotoSlab",
          color: Constants.darkPrimaryColor),
      headlineSmall: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Constants.darkPrimaryColor),
      bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Constants.darkTextColor),
      bodyMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: "RobotoSlab",
          color: Constants.darkTextColor),
      bodySmall: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: "ProtestRiot-Regular",
          color: Constants.darkTextColor),
      labelLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Constants.secondaryColor),
      labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Constants.secondaryColor),
      labelSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Constants.secondaryColor),
      displayLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Constants.darkTextColor,
      ),
      displayMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Constants.darkTextColor),
      displaySmall: const TextStyle(
        fontSize: 15,
        color: Constants.darkTextColor,
      ));
}
