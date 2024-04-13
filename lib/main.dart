import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_cart_payment_project/core/helper/bloc_observer.dart';
import 'package:smart_cart_payment_project/core/helper/cache_helper.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/auth/auth_cubit.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/user_login/user_login_cubit.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/user_register/user_register_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/splash_screen.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/utils/api_keys.dart';
import 'package:smart_cart_payment_project/features/setting/manager/cubits/change_user_data/change_user_data_cubit.dart';
import 'package:smart_cart_payment_project/features/setting/manager/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:smart_cart_payment_project/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  await CacheHelper.init();
  bool checkUserLoggedIn() {
    var uId = CacheHelper.getData(key: "uId");
    bool isUserLoggedIn = (uId != null) ? true : false;

    print(isUserLoggedIn);
    return isUserLoggedIn;
  }

  bool isUserLoggedIn = await checkUserLoggedIn();
  Stripe.publishableKey =ApiKeys.publishableKey;
  runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isUserLoggedIn});
  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()..changeScreenTail(true)),
        BlocProvider(create: (context) => UserLoginCubit()),
        BlocProvider(create: (context) => UserRegisterCubit()),
        BlocProvider(create: (context) => GetUserDataCubit()),
        BlocProvider(create: (context) => ChangeUserDataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        home: SplashScreen(isUserLoggedIn: isUserLoggedIn),
      ),
    );
  }
}
