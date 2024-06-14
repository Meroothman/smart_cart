import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/constants.dart';
import 'on_boarding_model.dart';
import 'on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      title: "Welcome to Smart Market ",
      image: "assets/images/1.png",
      body:
          " Prepare for a seamless shopping experience with our smart trolley.Let's start!",
    ),
    BoardingModel(
      title: "Easy Scan QR Code",
      image: "assets/images/2.png",
      body:
          "Link your Cart to the app by scanning its QR code for convenient shopping features",
    ),
    BoardingModel(
      title: "Easy Shopping for you ",
      image: "assets/images/3.png",
      body:
          "Put Your Products in Trolley Ensure products are placed clearly in the trolley for easy reading, enabling a smooth shopping experience",
    ),
    BoardingModel(
      title: "Easy end of your shopping",
      image: "assets/images/4.png",
      body:
          "The app calculates your total in real-time. Click checkout when done.",
    ),
    BoardingModel(
      title: "Secure and Easy Payment",
      image: "assets/images/5.png",
      body:
          "Pay securely through the app for a hassle-free checkout, embracing the future of shopping!",
    ),
  ];
  bool isLast = false;
  bool isActive = false;
   bool skipIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                skipIsActive = true;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: skipIsActive
                    ? Constants.primaryColor
                    : Constants.secondaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 50),
            Row(children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      isActive = false;
                    });
                    if (boardingController.page != 0) {
                      boardingController.previousPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                    }
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: isActive
                          ? Constants.secondaryColor
                          : Constants.primaryColor,
                    ),
                  )),
              const Spacer(),
              SmoothPageIndicator(
                controller: boardingController,
                effect: const WormEffect(
                  activeDotColor: Constants.primaryColor,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
                count: boarding.length,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isActive = true;
                    });
                    if (isLast) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: isActive
                          ? Constants.primaryColor
                          : Constants.secondaryColor,
                    ),
                  )),
            ])
          ],
        ),
      ),
    );
  }
}
