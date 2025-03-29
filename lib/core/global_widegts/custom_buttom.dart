import 'package:flutter/material.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? buttonColor;
  final double? width;
  final Color? textColor;
  final double? radius;
  final double? contentPadding;
  final Color? borderColor;
  const CustomButtom({
    super.key,
    required this.text,
    required this.ontap,
    this.width = double.infinity,
    this.radius = 24,
    this.contentPadding = 25,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = const Color(0xFF1C1C1E),
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius!),
        border: Border.all(color: borderColor!),
      ),
      child: Padding(
        padding: EdgeInsets.all(contentPadding!),
        child: InkWell(
          onTap: ontap,
          child: Center(
            child: Text(
              text,
              style: globalTextStyle(
                color: textColor!,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
