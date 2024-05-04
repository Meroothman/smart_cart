import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/functions.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/qr_code_screen.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    void scanQrCode() {
      pushNavigate(context, const QrCodeScreen());
    }

    return Scaffold(
        drawer: drawer(context),
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  scanQrCode();
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
                scanQrCode();
              
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
