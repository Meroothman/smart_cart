//import '../../../home/manager/cubits/order/order_cubit.dart';

import 'package:smart_cart_payment_project/core/utils/constants.dart';

class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    //to convert data to map
    return {
      'amount':'${Constants.totalPrice}00', 
      //'${OrderCubit().orderModel!.totalPrice}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
