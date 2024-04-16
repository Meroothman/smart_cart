import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/utils/styles.dart';

AppBar buildAppBar({final String? title, required final Function() ontap}) {
  return AppBar(
    leading: InkWell(
      onTap: ontap,
      child: Center(
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
        ),
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
