import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_cart_payment_project/core/helper/bloc_observer.dart';
import 'package:smart_cart_payment_project/core/helper/cache_helper.dart';
import 'package:smart_cart_payment_project/core/theme/theme_constants/app_bar_theme.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/auth/auth_cubit.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/user_login/user_login_cubit.dart';
import 'package:smart_cart_payment_project/features/auth/manager/cubits/user_register/user_register_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/splash_screen.dart';
import 'package:smart_cart_payment_project/features/payment_feature/core/utils/api_keys.dart';
import 'package:smart_cart_payment_project/features/setting/manager/cubits/change_user_data/change_user_data_cubit.dart';
import 'package:smart_cart_payment_project/features/setting/manager/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:smart_cart_payment_project/firebase_options.dart';
import 'core/theme/theme_constants/text_theme.dart';
import 'features/home/manager/cubits/get_orders/get_orders_cubit.dart';
import 'features/home/manager/cubits/order/order_cubit.dart';

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
    return isUserLoggedIn;
  }

  bool isUserLoggedIn = checkUserLoggedIn();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(MyApp(
    isUserLoggedIn: isUserLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isUserLoggedIn,
  });
  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = systemBrightness == Brightness.dark;
    CacheHelper.saveData(key: "isDark", value: true);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()..changeScreenTail(true)),
        BlocProvider(create: (context) => UserLoginCubit()),
        BlocProvider(create: (context) => UserRegisterCubit()),
        BlocProvider(create: (context) => GetUserDataCubit()),
        BlocProvider(create: (context) => ChangeUserDataCubit()),
        BlocProvider(create: (context) => OrderCubit()),
        BlocProvider(create: (context) => GetOrdersCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            themeMode: ThemeMode.dark,
            theme: ThemeData(
                shadowColor: Colors.black54,
                scaffoldBackgroundColor: Colors.white,
                primaryColor: Constants.primaryColor,
                secondaryHeaderColor: Constants.secondaryColor,
                appBarTheme: AppBarThemeConstants.lightAppBarTheme,
                textTheme: TextThemeConstants.lightTextTheme,
                brightness: Brightness.light),
            darkTheme: ThemeData(
                shadowColor: Colors.white70,
                scaffoldBackgroundColor: Constants.darkBGColor,
                primaryColor: Constants.darkPrimaryColor,
                secondaryHeaderColor: Constants.darkSecondaryColor,
                appBarTheme: AppBarThemeConstants.darkAppBarTheme,
                textTheme: TextThemeConstants.darkTextTheme,
                brightness: Brightness.dark),
            // You can use the library anywhere in the app even in theme
            // theme: ThemeData(
            //   primarySwatch: Colors.blue,
            //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            // ),
            home: SplashScreen(isUserLoggedIn: isUserLoggedIn),
          );
        },
      ),
    );
  }
}
