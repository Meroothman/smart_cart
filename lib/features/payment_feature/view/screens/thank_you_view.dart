import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/cutom_app_bar.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          // move widget on x,y axis
          offset: const Offset(0, -16),
          child: const ThankYouViewBody()),
    );
  }
}
