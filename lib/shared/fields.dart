// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:coffe/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String hint;
  final Icon prefixIcon;
  final TextInputType? type;
  final bool? obscureText;
  final TextEditingController? controller;

  const InputField({
    required this.hint,
    required this.prefixIcon,
    this.type,
    this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: Constants.radius,
        ),
      ),
    );
  }
}
