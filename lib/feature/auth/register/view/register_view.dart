import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/const/image_path.dart' show ImagePath;
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart'
    show CustomButtom;
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart'
    show CustomTextField;
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/auth/apply_here/view/apply_here_view.dart';
import 'package:manuelschneid/feature/auth/register/controller/register_controller.dart'
    show RegisterController;

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,

      body: Padding(
        padding: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(ImagePath.appImage, width: 86, height: 95),
                SizedBox(height: 10),
                Text(
                  "SignUp Here",
                  style: globalTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Start your journey to mastering money with fun, interactive lessons today!",
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    color: Color(0xFF7E7D7C),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: "User Name",
                ),
                SizedBox(height: 15),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Email",
                ),
                SizedBox(height: 15),
                CustomTextField(
                  controller: controller.phoneController,
                  hintText: "Phone Number",
                ),
                SizedBox(height: 15),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  isObscure: true,
                ),

                SizedBox(height: 56),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: globalTextStyle(
                      color: Color(0xFF7E7D7C),
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(text: "By continuing, you agree to the "),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: globalTextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy.",
                        style: globalTextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                CustomButtom(
                  text: "Sign Up",
                  ontap: () {
                    Get.to(() => ApplyHereView());
                  },
                ),
                SizedBox(height: 14),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: globalTextStyle(
                      color: Color(0xFF8C8482),
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Log In",
                        style: globalTextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.offAllNamed('/signinScreen');
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
