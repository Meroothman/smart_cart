import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/order/order_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/cart_view.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/cutom_app_bar.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/my_cart_view_body.dart';

import '../../../../core/utils/dialog.dart';
import '../../../../core/utils/functions.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'My Cart',
          ontap: () {
            CustomSimpleDialog.showCustomDialog(context, "Back", () {
              OrderCubit.get(context).checkAddProduct();
              replacementNavigate(context, const CartView());
            }, "Back", "Are you sure you want to back to your order ?!");
          }),
      body: const MyCartViewBody(),
    );
  }
}
