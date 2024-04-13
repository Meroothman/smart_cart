import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:smart_cart_payment_project/core/utils/functions.dart';
import 'package:smart_cart_payment_project/features/auth/view/screens/auth_screen.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/home_screen.dart';
import '../../../setting/manager/cubits/get_user_data/get_user_data_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.isUserLoggedIn});
  final bool isUserLoggedIn;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () {
      if (widget.isUserLoggedIn == true) {
        GetUserDataCubit.get(context).getUserData();

        replacementNavigate(context, const HomeScreen());
      } else {
        replacementNavigate(context, const AuthScreen());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 35),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Constants.splash_img))),
        ),
      ),
    );
  }
}
