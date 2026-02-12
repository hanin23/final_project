import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final Widget icon;
  final TextEditingController controller;
  final TextStyle style;
  final bool obscureText;
  final Widget? suffixIcon;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.style,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: style,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintText: hint,
      ),
    );
  }
}
