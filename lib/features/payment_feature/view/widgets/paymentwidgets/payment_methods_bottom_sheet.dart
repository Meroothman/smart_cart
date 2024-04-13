import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/paymentwidgets/custom_button_bloc_consumer.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/paymentwidgets/payment_methods_list_view.dart';


class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(),
          SizedBox(height: 32),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

