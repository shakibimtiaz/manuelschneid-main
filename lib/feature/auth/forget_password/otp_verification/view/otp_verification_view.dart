import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart'
    show OtpTextField;
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/background_path.dart'
    show BackgroundImagePath;
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart'
    show CustomButtom;
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/auth/forget_password/otp_verification/controller/otp_verification_controller.dart';
import 'package:manuelschneid/feature/auth/forget_password/reset_password/view/reset_password_view.dart';

class OtpVerificationView extends StatelessWidget {
  OtpVerificationView({super.key});

  final OtpVerificationController controller = Get.put(
    OtpVerificationController(),
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
            image: AssetImage(
              BackgroundImagePath.forgetPasswordOtpVarification,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 75, left: 24, right: 24, bottom: 30),
          child: Column(
            children: [
              Text(
                "Apply Here",
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
              OtpTextField(
                numberOfFields: 4,
                borderColor: Color(0xFFE5E7EB).withValues(alpha: 0.1),
                fillColor: Color(0xFFFFFFFF),
                textStyle: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: BorderRadius.circular(16),
                onSubmit: (otp) {
                  controller.setOtp(otp);
                },
                fieldWidth: 60,
                borderWidth: 2,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                showFieldAsBox: true,
              ),
              Spacer(),
              CustomButtom(
                text: "Apply Code",
                ontap: () {
                  Get.to(() => ResetPasswordView());
                },
              ),
              SizedBox(height: 14),
              CustomButtom(
                buttonColor: Colors.white.withValues(alpha: 0.04),
                borderColor: Colors.white.withValues(alpha: 0.01),
                textColor: Colors.white,
                text: "Send email again",
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
