import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_cart_payment_project/core/helper/cache_helper.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions.dart';
import '../../../../generated/l10n.dart';
import '../widgets/drawer.dart';

class NoProductScreen extends StatelessWidget {
  const NoProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                cancelOrder(context);
              },
              icon: const Icon(Icons.delete_outline_outlined)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              CacheHelper.getData(key: "isDark")
                  ? Constants.noProductsDark
                  : Constants.noProducts,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              S.of(context).no_product_text,
              style: TextStyle(
                color: Theme.of(context).hintColor,
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
