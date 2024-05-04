import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0XFFD9D9D9),
      radius: 50,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: 40,
        child: Icon(
          Icons.check,
          size: 50,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
