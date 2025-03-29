import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? verticalPadding;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.verticalPadding = 25.0,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xFFA7A7A7),
        ),
        filled: true,
        fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: verticalPadding ?? 25,
        ),
      ),
    );
  }
}
