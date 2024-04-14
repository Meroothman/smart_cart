import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';

Widget defaultButton({
  // login and signUp button
  double width = double.infinity,
  double height = 50.5,
  Color background = Constants.primaryColor,
  Color textColor = Colors.white,
  double radius = 0.0,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 18,
  String fontFamily = "RobotoSlab",
  required Function() onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
