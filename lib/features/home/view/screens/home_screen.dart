import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/order/order_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/cart_view.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    void startShopping() {
      OrderCubit.get(context).startOrder("123456mmshf");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CartView()));
    }

    return Scaffold(
        drawer: drawer(context),
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  startShopping();
                },
                icon: const ImageIcon(
                    AssetImage("assets/images/qr_code_scanner.png"))),
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
                startShopping();
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
        )));
  }
}
