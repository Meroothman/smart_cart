import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0XFFD9D9D9),
      radius: 50,
      child: CircleAvatar(
        backgroundColor: Constants.primaryColor,
        radius: 40,
        child: Icon(
          Icons.check,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
