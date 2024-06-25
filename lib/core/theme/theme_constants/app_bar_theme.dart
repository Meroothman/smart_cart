import "package:Auto_Shop/core/utils/constants.dart";
import "package:flutter/material.dart";
import "package:Auto_Shop/core/utils/constants.dart";

class AppBarThemeConstants {
  static const lightAppBarTheme = AppBarTheme(
    shadowColor: Colors.black87,
    iconTheme: IconThemeData(color: Colors.white, size: 20),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 20),
    backgroundColor: Constants.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: "RobotoSlab",
        fontWeight: FontWeight.bold),
  );

  static const darkAppBarTheme = AppBarTheme(
    shadowColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white, size: 20),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 20),
    backgroundColor: Constants.darkSecondaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
        color: Constants.darkSecondaryColor,
        fontSize: 20,
        fontFamily: "RobotoSlab",
        fontWeight: FontWeight.bold),
  );
}
