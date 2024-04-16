import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/home_screen.dart';
import '../../data/models/amout_model/amout_model.dart';
import '../../data/models/item_list_model/item_model.dart';
import '../../view/screens/thank_you_view.dart';
import '../utils/api_keys.dart';

void exceutePaypalPayment(BuildContext context,
    ({AmoutModel amount, ItemListModel itemList}) transctionsData) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.clientId,
      secretKey: ApiKeys.secretKeyPayPal,
      transactions: [
        {
          "amount": transctionsData.amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transctionsData.itemList.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }),
          (route) {
            if (route.settings.name == '/') {
              return true;
            } else {
              return false;
<<<<<<< HEAD
            }
          },
        );
      },
      onError: (error) {
        SnackBar snackBar = SnackBar(content: Text(error.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
          (route) {
            return false;
          },
        );
      },
      onCancel: () {
        print('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}
=======
            },
          );
        },
        onCancel: () {
         // print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
>>>>>>> 6b30953fc9878dc91defdd456b9f2367acd16c9e
