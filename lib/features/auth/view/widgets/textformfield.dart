import 'package:flutter/material.dart';
import 'package:smart_cart_payment_project/core/utils/constants.dart';


Widget defaultTextFormField({
  required TextEditingController controller,
  required String label,
  final Function(String)? onFieldSubmitted,
  final Function(String)? onChange,
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
        TextFormField(
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return " $label is required ";
            }
            return null;
          },
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureText,
          onFieldSubmitted: (String value) {
            // print(value);
          },
          onChanged: onChange,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color:
                      Constants.primaryColor), // Set the focused border color
            ),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
