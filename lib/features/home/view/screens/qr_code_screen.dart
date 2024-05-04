import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_cart_payment_project/features/home/manager/cubits/order/order_cubit.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/cart_view.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.first.rawValue == "123456mmshf") {
            OrderCubit.get(context).startOrder("123456mmshf");
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CartView()));
          }
        },
      ),
    );
  }
}
