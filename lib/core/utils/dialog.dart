// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/functions.dart';
import 'package:smart_cart_payment_project/generated/l10n.dart';

class CustomSimpleDialog {
  static void showCustomDialog(BuildContext context, String title,
      Function() confirm, String okText, String text) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              title,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            content: Text(
              text,
              style: const TextStyle(fontSize: 17),
            ),
            actions: <Widget>[
              defaultButton(
                  width: 100,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: S.of(context).cancel_text,
                  fontSize: 15,
                  background: Theme.of(context).secondaryHeaderColor,
                  radius: 20),
              defaultButton(
                  background: Theme.of(context).primaryColor,
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
