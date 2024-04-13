// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../core/utils/constants.dart';
import '/../core/widgets/button.dart';
import '/../features/auth/manager/cubits/auth/auth_cubit.dart';
import '/../features/auth/manager/cubits/user_login/user_login_cubit.dart';
import '/../features/auth/view/widgets/textformfield.dart';
import '/../features/home/view/screens/home_screen.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/helper/cache_helper.dart';
import '../../../../core/utils/functions.dart';
import '../../../setting/manager/cubits/get_user_data/get_user_data_cubit.dart';

// ignore: must_be_immutable
class LoginTail extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  LoginTail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserLoginCubit, UserLoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          BlocProvider.of<AuthCubit>(context).isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<AuthCubit>(context).isLoading = false;
          CacheHelper.saveData(key: "uId", value: state.uId);
          GetUserDataCubit.get(context).getUserData();
          replacementNavigate(context, const HomeScreen());
        } else if (state is LoginFailure) {
          BlocProvider.of<AuthCubit>(context).isLoading = false;

          showToast(context, state.message, ToastificationType.error);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            defaultTextFormField(
                onChange: (data) {
                  email = data;
                },
                controller: emailController,
                label: "Email"),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: defaultTextFormField(
                  onChange: (data) {
                    password = data;
                  },
                  controller: passwordController,
                  label: "Password",
                  obscureText: true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: defaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      UserLoginCubit.get(context).userLogin(email!, password!);
                    }
                  },
                  text: 'Login',
                  height: 45,
                  radius: 4,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        color: Constants.secondaryColor,
                        thickness: 1,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "or continue with",
                      style: TextStyle(color: Constants.secondaryColor),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        color: Constants.secondaryColor,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: SizedBox(
                        height: 25,
                        width: 30,
                        child: SvgPicture.asset(Constants.googleLogo),
                      )),
                  SizedBox(
                    height: 25,
                    width: 30,
                    child: SvgPicture.asset(Constants.facebookLogo),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
