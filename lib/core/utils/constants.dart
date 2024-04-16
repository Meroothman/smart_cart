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
  static const String scanQrCode = "assets/images/scanning_qr_code.png";
  static const String noProducts = "assets/images/no_product.png";

  //Colors
  static const Color primaryColor = Color.fromARGB(255, 100, 156, 194);
  // static const Color primaryColor = Color(0XFFB4D5FF);
  static Color secondaryColor = Colors.grey[600]!;

  //Strings
  static const String appName = 'SmartStore';

  //variables
  static String uId = CacheHelper.getData(key: "uId");
  static String userName = CacheHelper.getData(key: "userName");
  static int totalPrice = CacheHelper.getData(key: "totalPrice") ?? 0;
}
