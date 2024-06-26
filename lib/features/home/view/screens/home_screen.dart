import 'package:Auto_Shop/features/home/view/screens/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants.dart';
import '../../../../generated/l10n.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    // void scanQrCode() {
    //   // pushNavigate(context, const QrCodeScreen());
    //   OrderCubit.get(context).startOrder("123456mmshf");
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const CartView()));
    // }

    return Scaffold(
        drawer: drawer(context),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                Navigator.pushReplacement(
                 context, MaterialPageRoute(builder: (context) => const QrCodeScreen()));
                },
                icon: const ImageIcon(
                    AssetImage("assets/images/qr_code_scanner.png"))),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: Image.asset(Constants.scanQrCode)),
              Text(
                S.of(context).scan_qr_title,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "RobotoSlab",
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                 context, MaterialPageRoute(builder: (context) => const QrCodeScreen()));
                },
                child: Text(
                  S.of(context).start_shopping_text,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
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
        )));
  }
}
