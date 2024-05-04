import 'package:flutter/material.dart';

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
                "Account",
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
              showToast(context, ' Something went wrong , please try again',
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
                          onPressed: () {},
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
                      edit: "Name",
                      data: model.name,
                      ontap: () {
                        DialogUtils.showCustomDialog(
                            context: context,
                            title: "Edit Name",
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
                      edit: "Email",
                      data: model.email,
                      ontap: () {
                        DialogUtils.showCustomDialog(
                            context: context,
                            title: "Edit Email",
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
                      edit: "Phone",
                      data: model.phone,
                      ontap: () {
                        DialogUtils.showCustomDialog(
                            context: context,
                            title: "Edit Phone",
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
                      edit: "LogOut",
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
