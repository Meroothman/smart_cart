import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';
import 'package:toastification/toastification.dart';

// void showToast(context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//       duration: const Duration(seconds: 3),
//       backgroundColor: Colors.black,
//     ),
//   );

void showToast(BuildContext context, String text, ToastificationType type) {
  toastification.show(
    context: context,
    title: Text(text),
    autoCloseDuration: const Duration(seconds: 3),
    type: type,
    borderRadius: BorderRadius.circular(15),
    style: ToastificationStyle.minimal,
    primaryColor: Constants.primaryColor,
  );
}

// }

// void showToast(BuildContext context, String message) {
//   OverlayEntry overlayEntry;
//   overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       top: MediaQuery.of(context).size.height * 0.8,
//       width: MediaQuery.of(context).size.width,
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//           color: Colors.black.withOpacity(0.7),
//           child: Text(
//             message,
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     ),
//   );

//   Overlay.of(context).insert(overlayEntry);

//   // Remove the toast after 2 seconds
//   Future.delayed(Duration(seconds: 3)).then((value) {
//     overlayEntry.remove();
//   });
// }

void replacementNavigate(context, widget) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void pushNavigate(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}
