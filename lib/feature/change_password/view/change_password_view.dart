import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/bottom_navbar/view/bottom_navbar_view.dart';
import 'package:manuelschneid/feature/change_password/controller/change_password_controller.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final ChangePasswordController controller = Get.put(
    ChangePasswordController(),
  );

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
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              radius: 21,
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: globalTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 35),
        child: Column(
          children: [
            CustomTextField(
              verticalPadding: 20,
              controller: controller.oldPasswordController,
              hintText: "Old Password",
            ),
            SizedBox(height: 15),
            CustomTextField(
              verticalPadding: 20,
              controller: controller.newPasswordController,
              hintText: "New Password",
            ),
            SizedBox(height: 15),
            CustomTextField(
              verticalPadding: 20,
              controller: controller.confirmPasswordController,
              hintText: "Confirm Password",
            ),
            Spacer(),
            CustomButtom(
              contentPadding: 20,
              text: "Save",
              ontap: () {
                Get.offAll(() => BottomNavbarView());
              },
            ),
            SizedBox(height: 15),
            CustomButtom(
              buttonColor: Colors.white.withValues(alpha: 0.06),
              textColor: Colors.white,
              contentPadding: 20,
              text: "Cancel",
              ontap: () {
                Get.offAll(() => BottomNavbarView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
