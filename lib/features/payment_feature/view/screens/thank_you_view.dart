import 'package:flutter/material.dart';
import 'package:Auto_Shop/core/utils/functions.dart';
import 'package:Auto_Shop/features/home/manager/cubits/order/order_cubit.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/cutom_app_bar.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context,
          ontap: () {
            if (OrderCubit.get(context).orderSaved) {
              secondFinishOrder(context);
            } else {
              orderNotSaved(context);
            }
          }),
      body: Transform.translate(
          // move widget on x,y axis
          offset: const Offset(0, -16),
          child: const ThankYouViewBody()),
    );
  }
}
