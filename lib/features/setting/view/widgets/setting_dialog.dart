import 'package:flutter/material.dart';
import '/../core/widgets/button.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/utils/functions.dart';
import '../../manager/cubits/change_user_data/change_user_data_cubit.dart';
import '../../manager/cubits/get_user_data/get_user_data_cubit.dart';

class DialogUtils {
  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required Function() okButtonFunction,
    required String userKey,
    required String controller,
  }) {
    String newData = '';
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: TextField(
              onChanged: (data) {
                newData = data;
              },
              controller: TextEditingController(text: controller),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                Radius.circular(16),
              ))),
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
                  onPressed: () {
                    if (newData == '') {
                      newData = controller;
                    } else {
                      newData = newData;
                    }
                    ChangeUserDataCubit.get(context)
                        .changeUserData(userKey, newData);
                    showToast(context, 'Data Changed Successfully',
                        ToastificationType.success);
                    GetUserDataCubit.get(context).getUserData();

                    Navigator.pop(context);
                  },
                  text: 'Confirm',
                  fontSize: 15,
                  radius: 20),
            ],
          );
        });
  }
}
