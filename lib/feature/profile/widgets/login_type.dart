import 'package:flutter/material.dart';
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;

class LoginProfileContentContainer extends StatelessWidget {
  final Color? containerColor;
  final Color? textColor;
  final Color? avaterColor;
  final String image;
  final String text;
  final VoidCallback onTap;
  const LoginProfileContentContainer({
    super.key,
    this.containerColor = Colors.white,
    this.textColor = const Color(0xFF7E7D7C),
    this.avaterColor = const Color(0xFFF4F4F4),
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Image.asset(image, width: 34, height: 34),
            SizedBox(width: 25),
            Text(
              text,
              style: globalTextStyle(
                color: textColor!,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: avaterColor,
                child: Center(child: Icon(Icons.arrow_forward_ios, size: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
