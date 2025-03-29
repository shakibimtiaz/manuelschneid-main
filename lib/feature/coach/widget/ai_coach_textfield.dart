import 'package:flutter/material.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';

class AICoachTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffix;

  const AICoachTextField({super.key, required this.controller, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(35),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 22,
          ),
          hintText: "Type message",
          hintStyle: globalTextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFFF1F2F6),
          ),
          border: InputBorder.none,
          suffixIcon: suffix,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
