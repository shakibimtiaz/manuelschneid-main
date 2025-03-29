import 'package:flutter/material.dart';

class CustomMultilineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  const CustomMultilineTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white,
        ),
        maxLines: null,
        expands: true,
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
