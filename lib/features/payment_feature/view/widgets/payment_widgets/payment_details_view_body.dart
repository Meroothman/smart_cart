//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/widgets/button.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/screens/thank_you_view.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/custom_credit_card.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/widgets/payment_widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                child: defaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ThankYouView();
                      }));
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    } else {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ThankYouView();
                      }));
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Payment',
                  fontSize: 25,
                  radius: 15,
                  height: 60,
                ),
              )),
        ),
      ],
    );
  }
}
