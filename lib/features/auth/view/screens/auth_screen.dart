import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/auth/auth_cubit.dart';
import 'package:smart_cart_payment_project/features/auth/view/widgets/login_tail.dart';
import 'package:smart_cart_payment_project/features/auth/view/widgets/signup_tail.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        bool loginIsActive = AuthCubit.get(context).loginIsActive;

        return ModalProgressHUD(
            inAsyncCall: AuthCubit.get(context).isLoading,
            progressIndicator: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Constants.primaryColor),
            ),
            child: Scaffold(
                body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Constants.backgroundImg),
                      fit: BoxFit.fill)),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      children: [
                        const Spacer(flex: 1),
                        GestureDetector(
                          onTap: () {
                            AuthCubit.get(context).changeScreenTail(false);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: !loginIsActive
                                        ? Constants.primaryColor
                                        : Constants.secondaryColor),
                              ),
                              SizedBox(
                                width: 55,
                                child: Divider(
                                  color: !loginIsActive
                                      ? Constants.primaryColor
                                      : Colors.transparent,
                                  thickness: 4,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                        GestureDetector(
                          onTap: () {
                            AuthCubit.get(context).changeScreenTail(true);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: loginIsActive
                                        ? Constants.primaryColor
                                        : Constants.secondaryColor),
                              ),
                              SizedBox(
                                width: 55,
                                child: Divider(
                                  color: loginIsActive
                                      ? Constants.primaryColor
                                      : Colors.transparent,
                                  thickness: 4,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),
                  Container(
                    child: loginIsActive
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 50, right: 35, left: 35),
                            child: LoginTail(),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                top: 50, right: 35, left: 35),
                            child: SignUpTail(),
                          ),
                  ),
                ],
              ),
            )));
      },
    );
  }
}
