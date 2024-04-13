// import 'package:flutter/material.dart';
// import 'package:smart_cart/constants.dart';
// import 'package:smart_cart/view/widgets/button.dart';
// //import 'package:smart_cart/view/widgets/textformfield.dart';

// class DialogUtils {
//   static DialogUtils instance = DialogUtils.internal();

//   DialogUtils.internal();

//   factory DialogUtils() => instance;

//   static void showCustomDialog(BuildContext context,
//       {required TextEditingController controller,
//       required String title,
//       required Function() okBtnFunction}) {
//     showDialog(
//         context: context,
//         builder: (_) {
//           return AlertDialog(
//             backgroundColor: Colors.grey[100],
//             actions: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Text(
//                       title,
//                       style: const TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               SizedBox(
//                 height: 45,
//                 child: TextFormField(
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   controller: controller,
//                   decoration: const InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(width: 3, color: Constants.primaryColor),
//                         borderRadius: BorderRadius.all(Radius.circular(16))),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(16))),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     defaultButton(
//                         width: 100,
//                         onPressed: () {
//                           Navigator.pop(context);
//                           controller.clear();
//                         },
//                         text: 'Cancel',
//                         fontSize: 15,
//                         background: Colors.grey,
//                         radius: 20),
//                     defaultButton(
//                         width: 100,
//                         onPressed: okBtnFunction,
//                         text: 'Confirm',
//                         fontSize: 15,
//                         radius: 20),
//                   ],
//                 ),
//               )
//             ],
//           );
//         });
//   }
// }
