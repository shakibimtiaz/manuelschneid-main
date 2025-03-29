import 'package:flutter/material.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';

class GoalListContainers extends StatelessWidget {
  final String text;
  const GoalListContainers({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
        color: Colors.white.withValues(alpha: 0.05),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          text,
          style: globalTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
