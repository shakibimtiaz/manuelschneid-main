import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/background_path.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/auth/forget_password/email_verification/controller/forget_password_controller.dart'
    show ForgetPasswordController;
import 'package:manuelschneid/feature/auth/forget_password/otp_verification/view/otp_verification_view.dart'
    show OtpVerificationView;

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final ForgetPasswordController controller = Get.put(
    ForgetPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BackgroundImagePath.forgetPasswordemail),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 75, left: 24, right: 24, bottom: 30),
          child: Column(
            children: [
              Text(
                "Forget Password",
                style: globalTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Start your journey to mastering money with fun, interactive lessons today!",
                textAlign: TextAlign.center,
                style: globalTextStyle(color: Color(0xFF7E7D7C), fontSize: 12),
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: controller.emailController,
                hintText: "Email",
              ),
              Spacer(),
              CustomButtom(
                text: "Apply Code",
                ontap: () {
                  Get.to(() => OtpVerificationView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
