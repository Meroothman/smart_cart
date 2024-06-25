import 'package:flutter/material.dart';
import 'package:Auto_Shop/core/utils/constants.dart';

Widget defaultButton({
  // login and signUp button
  final bool isLoading = false,
  double width = double.infinity,
  double height = 50.5,
  Color background = Constants.primaryColor,
  double radius = 0.0,
  required Function() onPressed,
  required String text,
  required double fontSize,
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
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                ),
              ),
      ),
    );
