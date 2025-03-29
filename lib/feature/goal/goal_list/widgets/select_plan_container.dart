import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/goal/goal_list/controller/goal_controller.dart';

class SelectPlanContainer extends StatelessWidget {
  SelectPlanContainer({super.key});

  final GoalController controller = Get.find<GoalController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          children: [
            Expanded(
              child: Obx(
                () => GestureDetector(
                  onTap: () => controller.selectContainer(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          controller.selectedContainer.value == 1
                              ? AppColors.primaryColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                      child: Text(
                        'Personal Plan',
                        style: globalTextStyle(
                          color:
                              controller.selectedContainer.value == 1
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => GestureDetector(
                  onTap: () => controller.selectContainer(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          controller.selectedContainer.value == 2
                              ? AppColors.primaryColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                      child: Text(
                        'Ai Plan',
                        style: globalTextStyle(
                          color:
                              controller.selectedContainer.value == 2
                                  ? Colors.black
                                  : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
