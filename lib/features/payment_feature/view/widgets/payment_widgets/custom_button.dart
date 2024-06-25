// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:Auto_Shop/core/utils/constants.dart';
import 'package:Auto_Shop/features/payment_feature/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  final void Function()? onTap;

  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: Constants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
