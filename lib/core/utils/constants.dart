import 'package:flutter/material.dart';
import '../helper/cache_helper.dart';

class Constants {
  //
  //images
  static const String backgroundImg = "assets/images/background.jpg";
  // ignore: constant_identifier_names
  static const String splash_img = "assets/images/splash_image_2.gif";
  static const String appLogo = "assets/images/logo.jpg";
  static const String googleLogo = "assets/images/google.svg";
  static const String facebookLogo = "assets/images/facebook.svg";
  static const String scanQrCode = "assets/images/scanning_qr_code.png";
  static const String noProducts = "assets/images/no_product.png";

  //images in dark mode
  static const String noProductsDark = "assets/images/no_product-dark.png";

  //Light Theme Colors
  static const Color primaryColor = Color.fromARGB(255, 100, 156, 194);
  static Color secondaryColor = Colors.grey[600]!;

  //Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xff8EBBFF);
  static const Color darkSecondaryColor = Color.fromARGB(255, 39, 38, 38);
  static const Color darkTextColor = Color(0xffF4F5FC);
  static const Color darkBGColor = Color(0xFF212121);

  //Strings
  static const String appName = 'SmartStore';

  //variables
  static String uId = CacheHelper.getData(key: "uId");
  static String userName = CacheHelper.getData(key: "userName");
  static int totalPrice = CacheHelper.getData(key: "totalPrice") ?? 0;
}
