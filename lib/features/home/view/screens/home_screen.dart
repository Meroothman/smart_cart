import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/widgets/button.dart';
import 'package:smart_cart_payment_project/features/payment_feature/view/screens/my_card_view.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool languageIsSwitched = false;
  bool darkModeIsSwitch = false;

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
          child: Column(
            children: [
              defaultButton(onPressed:(){
               Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const MyCartView();
                      }));
              }, text: "Go To Payment", fontSize: 25)
            ]
          ),
        ),
      ),
    );
  }
}
