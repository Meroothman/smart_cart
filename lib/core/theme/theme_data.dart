import 'package:flutter/material.dart';
import 'package:Auto_Shop/core/theme/theme_constants/app_bar_theme.dart';
import 'package:Auto_Shop/core/utils/constants.dart';

import 'theme_constants/text_theme.dart';

class ThemeDataConstants {
  ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Constants.primaryColor,
      secondaryHeaderColor: Constants.secondaryColor,
      appBarTheme: AppBarThemeConstants.lightAppBarTheme,
      textTheme: TextThemeConstants.lightTextTheme,
      brightness: Brightness.light);

  ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Constants.darkBGColor,
      primaryColor: Constants.darkPrimaryColor,
      secondaryHeaderColor: Constants.darkSecondaryColor,
      appBarTheme: AppBarThemeConstants.darkAppBarTheme,
      textTheme: TextThemeConstants.darkTextTheme,
      brightness: Brightness.dark);
}
