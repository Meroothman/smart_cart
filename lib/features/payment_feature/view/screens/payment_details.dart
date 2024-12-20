import 'package:flutter/material.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/cutom_app_bar.dart';
import 'package:Auto_Shop/features/payment_feature/view/widgets/payment_widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(context: context, title: 'Payment Details', ontap: () {}),
      body: const PaymentDetailsViewBody(),
    );
  }
}
