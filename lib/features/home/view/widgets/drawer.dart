import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/../core/utils/constants.dart';

import '../../../../core/utils/functions.dart';
import '../../../auth/data/user_model.dart';
import '../../../setting/manager/cubits/get_user_data/get_user_data_cubit.dart';
import '../../../setting/view/screens/setting_screen.dart';

Drawer drawer(BuildContext context) {
  bool languageIsSwitched = false;
  bool darkModeIsSwitch = false;
  return Drawer(
    child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          UserModel model = GetUserDataCubit.get(context).model;
          return ListView(
            children: [
              // UserAccountsDrawerHeader(
              //     decoration: BoxDecoration(color: Colors.grey[100]),
              //     currentAccountPicture: const CircleAvatar(
              //       backgroundColor: Colors.white,
              //       backgroundImage: AssetImage("assets/images/person_image_2.png"),
              //     ),
              //     accountName: const Text(
              //       "Mariam fawzy",
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     accountEmail: const Text("mariamfawzy@gamil.com",
              //         style: TextStyle(color: Colors.black))),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: NetworkImage(
                              model.image), // Path to the image asset
                        )),
                    child: const Text(""),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 30),
                    child: InkWell(
                      onTap: () {
                        pushNavigate(context, const SettingScreen());
                      },
                      child: const Icon(
                        Icons.settings,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Name"),
                subtitle: Text(model.name),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("E-mail"),
                subtitle: Text(model.email),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                subtitle: Text(model.phone),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.dark_mode_outlined),
                title: const Text("Dark mode"),
                trailing: Switch(
                  value: darkModeIsSwitch,
                  onChanged: (value) {
                    // setState(() {
                    //   darkModeIsSwitch = value;
                    // });
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language_rounded),
                title: const Text("Language"),
                trailing: Switch(
                  activeColor: Constants.primaryColor,
                  value: languageIsSwitched,
                  onChanged: (value) {
                    // setState(() {
                    //   languageIsSwitched = value;
                    // });
                  },
                ),
              ),
              const Divider(),
              ListTile(
                  onTap: () {
                    pushNavigate(context, const SettingScreen());
                  },
                  leading: const Icon(Icons.settings),
                  title: const Text("Setting "),
                  trailing: const Icon(Icons.arrow_forward_ios)),
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text("Logout"),
                onTap: () {
                  logOut(context);
                },
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
