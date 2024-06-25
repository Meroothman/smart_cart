import "package:flutter/material.dart";
import "../../../../payment_feature/core/utils/styles.dart";
import "on_boarding_model.dart";

Widget buildBoardingItem(BoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Text(
          model.title,
          style: Styles.style22,
        ),
      ),
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        model.body,
        style: Styles.style18,
      ),
      const SizedBox(height: 20),
    ],
  );
}
