import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/models/payment_intent_input_model.dart';
import 'package:smart_cart_payment_project/features/payment_feature/manger/payment_cubit.dart';

import '../../../home/manager/cubits/order/order_cubit.dart';

void excuteStripePayment(BuildContext context) {
<<<<<<< HEAD
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '${OrderCubit.get(context).orderModel.totalPrice}',
    currency: 'USD',
    customerId: "cus_PbeH3D8S6hPNFN",
  );
  BlocProvider.of<PaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
=======
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '500', //edite
      currency: 'USD',
      customerId: "cus_PbeH3D8S6hPNFN",
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }
>>>>>>> 6b30953fc9878dc91defdd456b9f2367acd16c9e
