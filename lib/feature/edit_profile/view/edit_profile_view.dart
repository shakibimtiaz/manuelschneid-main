import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/icons_path.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/edit_profile/controller/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final EditProfileController controller = Get.put(EditProfileController());

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
                child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: globalTextStyle(
            color: Color(0xFFF1F2F6),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 14, right: 14, bottom: 30, top: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 62,
                      backgroundImage:
                          controller.selectedImageFile.value != null
                              ? FileImage(
                                File(controller.selectedImageFile.value!.path),
                              )
                              : AssetImage(ImagePath.userImage),
                    ),
                  ),

                  Positioned(
                    top: 93,
                    left: 90,
                    child: InkWell(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: Image.asset(
                        IconsPath.editIcon,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            CustomTextField(
              hintText: "",
              controller: controller.nameController,
            ),
            SizedBox(height: 15),
            CustomTextField(
              hintText: "",
              controller: controller.emailController,
            ),
            Spacer(),
            CustomButtom(text: "Save", ontap: () {}),
            SizedBox(height: 14),
            CustomButtom(
              buttonColor: Colors.white.withValues(alpha: 0.06),
              textColor: Colors.white,
              text: "Cancel",
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
