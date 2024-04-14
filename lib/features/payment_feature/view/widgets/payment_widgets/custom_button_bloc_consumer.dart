import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_cart_payment_project/features/payment_feature/manger/payment_cubit.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/screens/thank_you_view.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/custom_button.dart';
import '../../../core/functions/excete_stripe_payment.dart';
import '../../../core/functions/exceute_paypal_payment.dart';
import '../../../core/functions/get_transctions.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              if (isPaypal) {
                var transctionsData = getTransctionsData();
                exceutePaypalPayment(context, transctionsData);
              } else {
                excuteStripePayment(context);
              }
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }

 

 
}