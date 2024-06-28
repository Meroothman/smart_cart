import 'dart:async';

import 'package:Auto_Shop/features/home/view/screens/switch_page.dart';
import 'package:flutter/material.dart';
import 'package:Auto_Shop/features/home/view/screens/home_screen.dart';
import 'package:Auto_Shop/features/setting/manager/cubits/get_user_data/get_user_data_cubit.dart';
import '/../core/utils/constants.dart';
import '/../core/utils/functions.dart';

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
        GetUserDataCubit.get(context).getUserData(Constants.uId);

        replacementNavigate(context, const HomeScreen());
      } else {
        replacementNavigate(context, const SwitchPage());
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
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
