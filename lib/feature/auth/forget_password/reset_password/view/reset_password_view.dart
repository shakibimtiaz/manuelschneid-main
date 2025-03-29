import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/auth/forget_password/reset_password/controller/reset_password_controller.dart'
    show ResetPasswordController;

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 75, left: 24, right: 24, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Reset Password",
                style: globalTextStyle(
                  color: Color(0xFFF1F2F6),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Start your journey to mastering money with fun, interactive lessons today!",
                textAlign: TextAlign.center,
                style: globalTextStyle(color: Color(0xFF7E7D7C), fontSize: 12),
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: controller.passwordController,
                hintText: "New Password",
              ),
              SizedBox(height: 15),
              CustomTextField(
                controller: controller.confirmPasswordController,
                hintText: "Confirm Password",
              ),
              SizedBox(height: 50),
              Image.asset(ImagePath.appImage, width: 242, height: 296),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              CustomButtom(
                text: "Reset Password",
                ontap: () {
                  Get.offAllNamed('/signinScreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
