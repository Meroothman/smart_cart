import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_cart_payment_project/features/auth/data/user_model.dart';
import 'package:smart_cart_payment_project/features/setting/view/widgets/setting_dialog.dart';
import 'package:smart_cart_payment_project/features/setting/view/widgets/setting_row.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/utils/functions.dart';
import '../../manager/cubits/get_user_data/get_user_data_cubit.dart';
import '../widgets/logout_dialog.dart';
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(
                "Account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
              // Container(
              //   width: double.infinity,
              //   height: 150,
              //   color: Colors.grey[100],
              //   child: Center(
              //     child: Stack(children: [
              //       CircleAvatar(
              //         maxRadius: 55,
              //         backgroundImage: NetworkImage(model.image),
              //       ),
              //       Positioned(
              //         bottom: 30,
              //         height: 5,
              //         left: 55,
              //         child: IconButton(
              //           onPressed: () {
              //             print("object");
              //           },
              //           icon: const Icon(
              //             Icons.camera_alt,
              //             color: Colors.black,
              //             size: 30,
              //           ),
              //         ),
              //       ),
              //     ]),
              //   ),
              // ),
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
                            color: Colors.white),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
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
                      icon: const Icon(
                        color: Colors.black54,
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
                      icon: const Icon(
                        color: Colors.black54,
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
                      icon: const Icon(
                        color: Colors.black54,
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
                  //     icon: const Icon(
                  //       color: Colors.black54,
                  //       Icons.password,
                  //       size: 25,
                  //     )),
                  SettingRow(
                      edit: "LogOut",
                      data: "",
                      ontap: () {
                        LogoutDialog.showCustomDialog(context);
                      },
                      icon: const Icon(
                        color: Colors.black54,
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
