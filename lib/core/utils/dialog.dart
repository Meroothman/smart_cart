// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/functions.dart';

class CustomSimpleDialog {
  static void showCustomDialog(BuildContext context, String title,
      Function() confirm, String okText, String text) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 17),
            ),
            actions: <Widget>[
              defaultButton(
                  width: 100,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  fontSize: 15,
                  background: Colors.grey,
                  radius: 20),
              defaultButton(
                  width: 100,
                  onPressed: confirm,
                  text: okText,
                  fontSize: 15,
                  radius: 20),
            ],
          );
        });
  }
}
