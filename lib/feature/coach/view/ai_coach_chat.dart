import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/icons_path.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/coach/controller/coach_controller.dart';
import 'package:manuelschneid/feature/coach/widget/ai_coach_textfield.dart';

class AiCoachChat extends StatelessWidget {
  AiCoachChat({super.key});

  final CoachController controller = Get.find<CoachController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              radius: 21,
              backgroundColor: Color(0xFFF1F2F6).withValues(alpha: 0.1),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Ai Coach",
          style: globalTextStyle(
            color: Color(0xFFF1F2F6),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return Row(
                    mainAxisAlignment:
                        message.isUser
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.isUser)
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(ImagePath.userImage),
                        ),
                      SizedBox(width: 8),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      if (!message.isUser)
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(ImagePath.appImage),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 35),
            child: AICoachTextField(
              controller: controller.messageController,
              suffix: Padding(
                padding: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: controller.sendMessage,
                  child: Image.asset(IconsPath.sendButton, width: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
