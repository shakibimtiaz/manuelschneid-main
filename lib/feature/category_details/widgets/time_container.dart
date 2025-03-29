import 'package:flutter/material.dart';
import 'package:manuelschneid/core/const/icons_path.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF313131),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(IconsPath.clock, width: 20),
                SizedBox(width: 7),
                Text(
                  "5 Minutes",
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
              child: VerticalDivider(
                color: Colors.white.withValues(alpha: 0.1),
                thickness: 1,
                width: 10,
              ),
            ),

            Row(
              children: [
                Image.asset(IconsPath.reload, width: 20),
                SizedBox(width: 7),
                Text(
                  "1200 Kcal",
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
