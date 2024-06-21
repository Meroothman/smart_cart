// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:smart_cart_payment_project/core/utils/dialog.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/home_screen.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/screens/my_card_view.dart';
import 'package:toastification/toastification.dart';

import '../../features/auth/view/screens/auth_screen.dart';
import '../../features/home/manager/cubits/order/order_cubit.dart';
import '../../features/home/view/screens/cart_view.dart';
import '../helper/cache_helper.dart';

void showToast(BuildContext context, String text, ToastificationType type) {
  toastification.show(
    context: context,
    title: Text(text),
    autoCloseDuration: const Duration(seconds: 3),
    type: type,
    borderRadius: BorderRadius.circular(15),
    style: ToastificationStyle.minimal,
    primaryColor: Constants.primaryColor,
  );
}

void replacementNavigate(context, widget) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void pushNavigate(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void logOut(BuildContext context) {
  return CustomSimpleDialog.showCustomDialog(context, "Logout", () async {
    await FirebaseAuth.instance.signOut();
    CacheHelper.removeData(key: "uId");
    replacementNavigate(context, const AuthScreen());
  }, "Logout", "Are you sure you want to log out ?!");
}

void cancelOrder(BuildContext context) {
  return CustomSimpleDialog.showCustomDialog(context, "Cancel Order", () {
    OrderCubit.get(context).cancelOrder();
    replacementNavigate(context, const HomeScreen());
  }, "Confirm", "Are you sure you want to Cancel your order ?!");
}

void finishOrder(BuildContext context, int totalPrice) {
  return CustomSimpleDialog.showCustomDialog(context, "Finish Order", () {
    CacheHelper.saveData(key: "totalPrice", value: totalPrice);
    Constants.totalPrice = CacheHelper.getData(key: "totalPrice");
    replacementNavigate(context, const MyCartView());
  }, "Confirm", "Are you sure you want to Finish your order ?!");
}

void backShopping(context) {
  CustomSimpleDialog.showCustomDialog(context, "Back", () {
    replacementNavigate(context, const CartView());
  }, "Back", "Are you sure you want to back to your order ?!");
}

void secondFinishOrder(BuildContext context) {
  OrderCubit.get(context).finishOrder();
  replacementNavigate(context, const HomeScreen());
}

void orderNotSaved(context) {
  CustomSimpleDialog.showCustomDialog(context, "order Not Saved", () {
    secondFinishOrder(context);
  }, "Continue", "Are you sure you want to continue without save order ?!");
}

defaultButton({
  // login and signUp button
  double width = double.infinity,
  double height = 50.5,
  Color background = Constants.primaryColor,
  Color textColor = Colors.white,
  double radius = 0.0,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 18,
  String fontFamily = "RobotoSlab",
  required Function() onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
