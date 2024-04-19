import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/order/order_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/cart_view.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/no_product_screen.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override

  // bool languageIsSwitched = false;
  // String cartId = "45346854843";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context),
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NoProductScreen()),
                  );
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
                OrderCubit.get(context).startOrder("1542488962");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const CartView()));
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
