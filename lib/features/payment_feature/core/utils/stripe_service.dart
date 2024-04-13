import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/utils/api_keys.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/utils/api_service.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/models/payment_intent_input_model.dart';
import 'package:smart_cart_payment_project/features/payment_feature/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  // create payment intent model
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required String paymentIntentClientSecret,
      String? merchantDisplayName}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Mariam" // name of bussiness owner
            ));
  }

  Future displayPaymentSheet() async {
    // show payment sheet
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      // start point to check out
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
