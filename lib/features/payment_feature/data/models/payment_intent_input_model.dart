<<<<<<< HEAD
import 'package:smart_cart_payment_project/core/utils/constants.dart';
=======
import '../../../home/manager/cubits/order/order_cubit.dart';
>>>>>>> 721009042374a467044e040eb9450a8f3ba3008d

class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    //to convert data yo map
    return {
<<<<<<< HEAD
      'amount': '\$${Constants.totalPrice} 00',
=======
      'amount': '${OrderCubit().orderModel.totalPrice}00',
>>>>>>> 721009042374a467044e040eb9450a8f3ba3008d
      'currency': currency,
      'customer': customerId,
    };
  }
}
