import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '/../features/auth/data/user_model.dart';
import '/../features/setting/view/widgets/setting_dialog.dart';
import '/../features/setting/view/widgets/setting_row.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/utils/functions.dart';
import '../../manager/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).hintColor,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                S.of(context).account_text,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<GetUserDataCubit, GetUserDataState>(
          listener: (context, state) {
            if (state is GetUserDataFailure) {
              showToast(context, S.of(context).update_failure_text,
                  ToastificationType.error);
            }
          },
          builder: (context, state) {
            UserModel model = GetUserDataCubit.get(context).model;
            return Column(children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: NetworkImage(model.image))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.transparent),
                        child: IconButton(
                          onPressed: () {
                            GetUserDataCubit.get(context).getImage();
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).hintColor,
                            size: 30,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  SettingRow(
                      edit: S.of(context).name_title,
                      data: model.name,
                      ontap: () {
                        DialogUtils.showCustomDialog(
                            context: context,
                            title: S.of(context).edit_name_text,
                            okButtonFunction: () {},
                            userKey: 'name',
                            controller: model.name);
                      },
                      icon: Icon(
                        color: Theme.of(context).hintColor,
                        Icons.person,
                        size: 25,
                      )),
                  SettingRow(
                      edit: S.of(context).email_title,
                      data: model.email,
                      ontap: () {
                        DialogUtils.showCustomDialog(
                            context: context,
                            title: S.of(context).edit_email_text,
                            controller: model.email,
                            okButtonFunction: () {},
                            userKey: 'email');
                      },
                      icon: Icon(
                        color: Theme.of(context).hintColor,
                        Icons.email,
                        size: 25,
                      )),
                  SettingRow(
                      edit: S.of(context).phone_title,
                      data: model.phone,
                      ontap: () {
                        DialogUtils.showCustomDialog(
                            context: context,
                            title: S.of(context).edit_phone_text,
                            okButtonFunction: () {},
                            userKey: 'phone',
                            controller: model.phone);
                      },
                      icon: Icon(
                        color: Theme.of(context).hintColor,
                        Icons.phone,
                        size: 25,
                      )),
                  // SettingRow(
                  //     edit: "Reset password",
                  //     data: "",
                  //     ontap: () {
                  //       DialogUtils.showCustomDialog(context,
                  //           title: "Reset password",
                  //           okButtonFunction: () {},
                  //           controller: '', userKey: '');
                  //     },
                  //     icon:  Icon(
                  //       color: Theme.of(context).hintColor,
                  //       Icons.password,
                  //       size: 25,
                  //     )),
                  SettingRow(
                      edit: S.of(context).logout_text,
                      data: "",
                      ontap: () {
                        logOut(context);
                      },
                      icon: Icon(
                        color: Theme.of(context).hintColor,
                        Icons.logout,
                        size: 25,
                      )),
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}
