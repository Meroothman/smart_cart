import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/custom_check_icon.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/custom_dashed_line.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          const Positioned(
              // check Icon
              right: 0,
              left: 0,
              top: -50,
              child: CustomCheckIcon()),
          Positioned(
            //right circleAvater
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
          ),
          Positioned(
            // -----line
            left: 20 + 5,
            right: 20 + 5,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: const CustomDashedLine(),
          ),
          Positioned(
            // left circleAvater
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
          ),
        ],
      ),
    );
  }
}
