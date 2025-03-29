import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_dropdown_widget.dart';
import 'package:manuelschneid/core/global_widegts/custom_multiline_textfield.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/create_training/controller/create_training_controller.dart';

class CreateTraining extends StatelessWidget {
  CreateTraining({super.key});

  final CreateTrainingController controller = Get.put(
    CreateTrainingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(
          "Create Training",
          style: globalTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            CustomTextField(
              verticalPadding: 16,
              controller: controller.courseTitleController,
              hintText: "Enter Course Title",
            ),
            SizedBox(height: 10),
            CustomDropdown(
              items: ["all", "Box", "Upper Body", "Lower Body"],
              hintText: "Enter Category",
              controller: controller.categoryController,
            ),
            SizedBox(height: 10),
            CustomMultilineTextField(
              controller: controller.curseDescriptionController,
              hintText: "Enter Course Description",
            ),
            SizedBox(height: 10),
            CustomTextField(
              verticalPadding: 16,
              controller: controller.courseTimer,
              hintText: "Enter Course Timer",
            ),
            SizedBox(height: 10),
            CustomTextField(
              verticalPadding: 16,
              controller: controller.courseCoal,
              hintText: "Enter Course Kcal",
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: controller.pickVideo,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(
                    alpha: 0.04,
                  ), // Fixed color issue
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Obx(
                        () => Text(
                          controller.courseVideoController.value.isEmpty
                              ? "Upload Course Video"
                              : controller.courseVideoController.value,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Icon(Icons.upload_file, color: Colors.white54),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomButtom(
              contentPadding: 16,
              text: "Create Training",
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
