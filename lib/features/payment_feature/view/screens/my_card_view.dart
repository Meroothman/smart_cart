import 'package:flutter/material.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/cutom_app_bar.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/my_cart_view_body.dart';

import '../../../../core/utils/functions.dart';
import '../../../../generated/l10n.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context,
          title: S.of(context).my_cart_title,
          ontap: () {
            backShopping(context);
          }),
      body: const MyCartViewBody(),
    );
  }
}
