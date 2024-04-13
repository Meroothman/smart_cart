import 'package:flutter/material.dart';
import '../helper/cache_helper.dart';

class Constants {
  //images
  static const String backgroundImg = "assets/images/back.jpg";
  // ignore: constant_identifier_names
  static const String splash_img = "assets/images/splash_image_2.gif";
  static const String appLogo = "assets/images/logo.jpg";
  static const String googleLogo = "assets/images/google.svg";
  static const String facebookLogo = "assets/images/facebook.svg";
  static const String shoppingImg = "assets/images/shopping-cart.gif";

  //Colors
  static const Color primaryColor = Color.fromARGB(255, 100, 156, 194);
  static Color secondaryColor = Colors.grey[600]!;

  //Strings
  static const String appName = 'SmartStore';

  //variables
  static String uId = CacheHelper.getData(key: "uId");
}
