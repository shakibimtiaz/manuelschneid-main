import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/coach/controller/coach_controller.dart';
import 'package:manuelschneid/feature/coach/view/ai_coach_chat.dart'
    show AiCoachChat;

class CoachView extends StatelessWidget {
  CoachView({super.key});

  final CoachController controller = Get.put(CoachController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(ImagePath.appImage, width: 242, height: 430),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: globalTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              children: [
                TextSpan(text: "How may i help you today!"),
                TextSpan(
                  text: "Manuelschneid",
                  style: globalTextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          CustomButtom(
            radius: 96,
            width: 190,
            contentPadding: 16,
            text: "Let’s Start",
            ontap: () {
              Get.to(() => AiCoachChat());
            },
          ),
        ],
      ),
    );
  }
}
