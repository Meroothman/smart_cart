import '../../../home/manager/cubits/order/order_cubit.dart';

class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    //to convert data yo map
    return {
      'amount': '${OrderCubit().orderModel.totalPrice}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
