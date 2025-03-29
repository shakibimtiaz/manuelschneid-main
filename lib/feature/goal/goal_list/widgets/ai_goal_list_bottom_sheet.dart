import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_dropdown_widget.dart'
    show CustomDropdown;
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/goal/goal_list/controller/goal_controller.dart'
    show GoalController;

void showAiGoalListBottomSheet(BuildContext context) {
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
                      "Customize your training plan based on your fitness level",
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset(ImagePath.aiq1, width: 216, height: 214),
                    SizedBox(height: 20),
                    CustomDropdown(
                      items: ["Beginner", "Intermediate", "Advanced"],
                      hintText: "Beginner/Intermediate/Advanced",
                      controller: controller.aiq1Controller,
                    ),
                    SizedBox(height: 50),
                    CustomButtom(
                      contentPadding: 16,
                      text: "Next",
                      ontap: () {
                        Navigator.pop(
                          context,
                        ); // Close the current bottom sheet
                        showNextBottomSheet(context);
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

void showNextBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF242424),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    isScrollControlled: true,
    builder:
        (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Set your training goals",
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset(ImagePath.aiq2, width: 216, height: 214),
                    SizedBox(height: 20),
                    CustomDropdown(
                      items: ["WStrength", "Endurance", "Technique"],
                      hintText: "Strength/ Endurance/ Technique",
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 50),
                    CustomButtom(
                      contentPadding: 16,
                      text: "Next",
                      ontap: () {
                        Navigator.pop(context);
                        showFinalBottomSheet(context);
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

void showFinalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF242424),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    isScrollControlled: true,
    builder:
        (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Confirm your training preferences",
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset(ImagePath.aiq3, width: 216, height: 214),
                    SizedBox(height: 20),
                    CustomDropdown(
                      items: ["0 Days", "1 Days", "2 Days"],
                      hintText: "0 Days",
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 50),
                    CustomButtom(
                      contentPadding: 16,
                      text: "Finish",
                      ontap: () {
                        Navigator.pop(context);
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
