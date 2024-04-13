import 'package:dartz/dartz.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/errors/failures.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/models/payment_intent_input_model.dart';


abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required  PaymentIntentInputModel paymentIntentInputModel});
}


