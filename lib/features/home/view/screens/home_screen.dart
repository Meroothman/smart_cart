import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/test.dart';

import '../../../../core/utils/functions.dart';
import '../../../../core/widgets/button.dart';
import '../../manager/cubits/order/order_cubit.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool languageIsSwitched = false;
  bool darkModeIsSwitch = false;
  String cartId = "45346854843";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                  AssetImage("assets/images/qr_code_scanner.png"))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 35),
        child: Container(
          child: defaultButton(
            text: "Start",
            fontSize: 20,
            onPressed: () {
              OrderCubit.get(context).startOrder(cartId);
              pushNavigate(context, const Test());

              // replacementNavigate(context, const Test());
            },
          ),
        ),
      ),
    );
  }
}
