// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Auto_Shop/generated/l10n.dart';
import '/../core/utils/constants.dart';
import '/../features/auth/manager/cubits/auth/auth_cubit.dart';
import '/../features/auth/manager/cubits/user_login/user_login_cubit.dart';
import '/../features/auth/view/widgets/textformfield.dart';
import '/../features/home/view/screens/home_screen.dart';
import 'package:toastification/toastification.dart';
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
          BlocProvider.of<AuthCubit>(context).loadingState(true);
        } else if (state is LoginSuccess) {
          BlocProvider.of<AuthCubit>(context).loadingState(false);
          // CacheHelper.saveData(key: "userName", value: state.name);
          GetUserDataCubit.get(context).getUserData(Constants.uId);
          replacementNavigate(context, const HomeScreen());
        } else if (state is LoginFailure) {
          BlocProvider.of<AuthCubit>(context).loadingState(false);

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
                label: S.of(context).email_title),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: defaultTextFormField(
                  onChange: (data) {
                    password = data;
                  },
                  controller: passwordController,
                  label: S.of(context).password_title,
                  obscureText: true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: defaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      UserLoginCubit.get(context)
                          .userLogin(email!, password!, context);
                    }
                  },
                  text: S.of(context).login_title,
                  background: Theme.of(context).primaryColor,
                  height: 45,
                  radius: 4,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
