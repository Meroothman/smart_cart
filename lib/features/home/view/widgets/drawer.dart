import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Auto_Shop/features/home/manager/cubits/get_orders/get_orders_cubit.dart';
import 'package:Auto_Shop/features/home/manager/cubits/language/language_cubit.dart';
import 'package:Auto_Shop/generated/l10n.dart';
import '../screens/history_screen.dart';

import '../../../../core/utils/functions.dart';
import '../../../auth/data/user_model.dart';
import '../../../setting/manager/cubits/get_user_data/get_user_data_cubit.dart';
import '../../../setting/view/screens/setting_screen.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        UserModel model = GetUserDataCubit.get(context).model;
        return ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    child: Icon(
                      Icons.settings,
                      color: Theme.of(context).hintColor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(S.of(context).name_title),
              subtitle: Text(model.name),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(S.of(context).email_title),
              subtitle: Text(model.email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(S.of(context).phone_title),
              subtitle: Text(model.phone),
            ),
            const Divider(),
            // BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
            //   builder: (context, state) {
            //     return ListTile(
            //       leading: const Icon(Icons.dark_mode_outlined),
            //       title: const Text("Dark mode"),
            //       trailing: Switch(
            //         activeColor: Theme.of(context).primaryColor,
            //         value: ThemeManagerCubit.get(context).isDark,
            //         onChanged: (value) {
            //           ThemeManagerCubit.get(context).themeChange();
            //         },
            //       ),
            //     );
            //   },
            // ),
            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.language_rounded),
                  title: Text(S.of(context).language_text),
                  trailing: Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: LanguageCubit.get(context).isAr,
                    onChanged: (value) {
                      LanguageCubit.get(context).languageChange();
                    },
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
                onTap: () {
                  pushNavigate(context, const SettingScreen());
                },
                leading: const Icon(Icons.settings),
                title: Text(S.of(context).setting_text),
                trailing: const Icon(Icons.arrow_forward_ios)),
            ListTile(
                onTap: () {
                  GetOrdersCubit.get(context).getOrders();
                  pushNavigate(context, const History());
                },
                leading: const Icon(Icons.archive_rounded),
                title: Text(S.of(context).history_text),
                trailing: const Icon(Icons.arrow_forward_ios)),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: Text(S.of(context).logout_text),
              onTap: () {
                logOut(context);
              },
            ),
          ],
        );
      },
    ),
  );
}
