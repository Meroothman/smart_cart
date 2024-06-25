import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Auto_Shop/core/utils/constants.dart';
import 'package:Auto_Shop/features/payment_feature/data/models/payment_intent_input_model.dart';
import 'package:Auto_Shop/features/payment_feature/manger/payment_cubit.dart';
//import 'package:Auto_Shop/features/home/manager/cubits/order/order_cubit.dart';

void excuteStripePayment(BuildContext context) {
  BlocProvider.of<PaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}

PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
  amount: "\$${Constants.totalPrice}", //edite
  currency: 'USD',
  customerId: "cus_PbeH3D8S6hPNFN",
);
