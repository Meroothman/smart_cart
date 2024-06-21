import 'package:dartz/dartz.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/errors/failures.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/utils/stripe_service.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/models/payment_intent_input_model.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/repos/checkout_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      //print(e.toString());
      return left(ServerFailure(errorMessage:"some thing went wrong, please try again"));
    }
  }
}
