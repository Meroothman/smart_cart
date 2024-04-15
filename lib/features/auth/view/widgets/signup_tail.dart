// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../core/utils/constants.dart';
import '/../features/auth/manager/cubits/auth/auth_cubit.dart';
import '/../features/auth/manager/cubits/user_register/user_register_cubit.dart';
import '/../features/auth/view/widgets/textformfield.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/helper/cache_helper.dart';
import '../../../../core/utils/functions.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../setting/manager/cubits/get_user_data/get_user_data_cubit.dart';

// ignore: must_be_immutable
class SignUpTail extends StatelessWidget {
  SignUpTail({super.key});

//controller
  var passwordController = TextEditingController();

  var emailController = TextEditingController();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var phoneController = TextEditingController();

//on change
  String? password;

  String? email;

  String? firstName;

  String? lastName;

  String? phone;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserRegisterCubit, UserRegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          BlocProvider.of<AuthCubit>(context).isLoading = true;
        } else if (state is RegisterSuccess) {
          BlocProvider.of<AuthCubit>(context).isLoading = false;
          CacheHelper.saveData(key: "uId", value: state.uId);
          CacheHelper.saveData(key: "userName", value: "$firstName $lastName");
          GetUserDataCubit.get(context).getUserData();

          replacementNavigate(context, HomeScreen());
        } else if (state is RegisterFailure) {
          BlocProvider.of<AuthCubit>(context).isLoading = false;

          showToast(context, state.message, ToastificationType.error);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: defaultTextFormField(
                    onChange: (data) {
                      firstName = data;
                    },
                    controller: firstNameController,
                    label: "First Name",
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: defaultTextFormField(
                      onChange: (data) {
                        lastName = data;
                      },
                      controller: lastNameController,
                      label: "Last Name"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: defaultTextFormField(
                  onChange: (data) {
                    email = data;
                  },
                  controller: emailController,
                  label: "Email"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: defaultTextFormField(
                  onChange: (data) {
                    phone = data;
                  },
                  controller: phoneController,
                  label: "phone"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: defaultTextFormField(
                  onChange: (data) {
                    password = data;
                  },
                  controller: passwordController,
                  label: "Password",
                  obscureText: true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: defaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      UserRegisterCubit.get(context).userRegister(
                          email!, password!, firstName!, lastName!, phone!);
                    }
                  },
                  text: 'Sign up',
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
            ),
          ],
        ),
      ),
    );
  }
}
