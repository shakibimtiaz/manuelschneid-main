import 'package:flutter/material.dart';

class SeeAllCustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  const SeeAllCustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
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
          color: Colors.white,
        ),
        filled: true,
        fillColor: const Color(0xFFFFFFFF).withValues(alpha: 0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
