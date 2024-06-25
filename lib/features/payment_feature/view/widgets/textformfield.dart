import 'package:flutter/material.dart';
import 'package:Auto_Shop/core/utils/constants.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String label,
  // required String? Function(String?)? validator,
  final Function(String)? onFieldSubmitted,
  double radius = 0.0,
  bool obscureText = false,
  keyboardType = TextInputType.text,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600]),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 45,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            // validator: validator,
            controller: controller,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            onFieldSubmitted: (String value) {
              // print(value);
            },
            onChanged: (String value) {
              // print(value);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color:
                        Constants.primaryColor), // Set the focused border color
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
