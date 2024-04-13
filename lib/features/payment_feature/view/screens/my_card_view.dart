import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/cutom_app_bar.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}
