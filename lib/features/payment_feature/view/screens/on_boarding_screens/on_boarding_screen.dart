import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/features/home/view/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'on_boarding_model.dart';
import 'on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;
  bool isActive = false;
  bool skipIsActive = false;

  @override
  Widget build(BuildContext context) {
    
  List<BoardingModel> boarding = [
    BoardingModel(
      title: S.of(context).on_board_title,
      image: "assets/images/1.png",
      body:S.of(context).on_board_body,
    ),
    BoardingModel(
      title: S.of(context).on_board_title2,
      image: "assets/images/2.png",
      body:S.of(context).on_board_body2,
    ),
    BoardingModel(
      title: S.of(context).on_board_title3,
      image: "assets/images/3.png",
      body:S.of(context).on_board_body3,
    ),
    BoardingModel(
      title: S.of(context).on_board_title4,
      image: "assets/images/4.png",
      body:S.of(context).on_board_body4,
    ),
    BoardingModel(
      title: S.of(context).on_board_title5,
      image: "assets/images/5.png",
      body:S.of(context).on_board_body5,
    ),
  ];
 
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
              S.of(context).skip_text,
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
                    S.of(context).back_text,
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
                    S.of(context).next_text,
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
