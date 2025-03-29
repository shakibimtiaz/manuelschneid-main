import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_date_picker.dart';
import 'package:manuelschneid/core/global_widegts/custom_multiline_textfield.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/goal/goal_list/controller/goal_controller.dart';

void showGoalListBottomSheet(BuildContext context) {
  final GoalController controller = Get.find<GoalController>();
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF242424),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    isScrollControlled: true,
    builder:
        (context) => Padding(
          padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Fit content height
                  children: [
                    Text(
                      "Log New Workout",
                      style: globalTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      verticalPadding: 20,
                      controller: controller.titleController,
                      hintText: "Workout Title",
                    ),
                    const SizedBox(height: 10),
                    CustomDatePicker(
                      verticalPadding: 20,
                      controller: controller.dateController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      verticalPadding: 20,
                      controller: controller.workoutTypeController,
                      hintText: "Workout Type",
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      verticalPadding: 20,
                      controller: controller.workoutTimer,
                      hintText: "Workout Timer",
                    ),
                    const SizedBox(height: 10),
                    CustomMultilineTextField(
                      controller: controller.workoutTimer2,
                      hintText: "Workout Timer",
                    ),
                    const SizedBox(height: 20),
                    CustomButtom(
                      contentPadding: 16,
                      text: "Save",
                      ontap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
  );
}
