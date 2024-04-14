import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';

class NoProductScreen extends StatelessWidget {
  const NoProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        actions: const [
          ImageIcon(AssetImage("assets/images/qr_code_scanner.png")),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Constants.noProducts),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "No Product Go find products and add to cart.",
              style: TextStyle(
                color: Constants.secondaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoSlab",
              ),
            ),
            SizedBox(
              height: 120.h,
            )
          ],
        ),
      ),
    );
  }
}
