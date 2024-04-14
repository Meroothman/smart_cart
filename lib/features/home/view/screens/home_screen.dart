import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_cart_payment_project/core/utils/functions.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/order/order_cubit.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/scan_cubit/scan_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/cart_view.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  bool languageIsSwitched = false;
  bool darkModeIsSwitch = false;
  String cartId = "45346854843";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        actions: [
          BlocListener<ScanCubit, ScanState>(
            listener: (context, state) {
              if (state is ScanningSuccess) {
                ///>>>>>>>> cart id == state.cartId
                OrderCubit.get(context).startOrder(cartId);
                replacementNavigate(context, const CartView());
              } else if (state is ScanningError) {
                showToast(context, state.error, ToastificationType.error);
              }
            },
            child: IconButton(
                onPressed: () {
                  ScanCubit.get(context).scanQR();
                },
                icon: const ImageIcon(
                    AssetImage("assets/images/qr_code_scanner.png"))),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(Constants.scanQrCode)),
            const Text(
              "Scan the QR code on your trolley to",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                fontFamily: "RobotoSlab",
              ),
            ),
            TextButton(
              onPressed: () {
                ScanCubit.get(context).scanQR();
              },
              child: const Text(
                " Start Shopping",
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  fontFamily: "RobotoSlab",
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            )
          ],
        ),
      ),
    );
  }
}
