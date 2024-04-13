// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/../core/widgets/button.dart';

import '../../../../core/helper/cache_helper.dart';
import '../../../../core/utils/functions.dart';
import '../../../auth/view/screens/Auth_screen.dart';

class LogoutDialog {
  static void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text(
              'Are you sure you want to log out?',
              style: TextStyle(color: Colors.black, fontSize: 17),
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
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    CacheHelper.removeData(key: "uId");
                    replacementNavigate(context, const AuthScreen());
                  },
                  text: 'LogOut',
                  fontSize: 15,
                  radius: 20),
            ],
          );
        });
  }
}
