import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/goal/goal_list/controller/goal_controller.dart';
import 'package:manuelschneid/feature/goal/goal_list/widgets/ai_goal_list.dart';
import 'package:manuelschneid/feature/goal/goal_list/widgets/ai_goal_list_bottom_sheet.dart'
    show showAiGoalListBottomSheet;
import 'package:manuelschneid/feature/goal/goal_list/widgets/goal_list.dart'
    show GoalList;
import 'package:manuelschneid/feature/goal/goal_list/widgets/goal_list_bottom_sheet.dart'
    show showGoalListBottomSheet;
import 'package:manuelschneid/feature/goal/goal_list/widgets/select_plan_container.dart'
    show SelectPlanContainer;

class GoalView extends StatelessWidget {
  GoalView({super.key});

  final GoalController controller = Get.put(GoalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(
          "Personal Plan",
          style: globalTextStyle(
            color: Color(0xFFF1F2F6),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                if (controller.selectedContainer.value == 1) {
                  showGoalListBottomSheet(context);
                } else if (controller.selectedContainer.value == 2) {
                  showAiGoalListBottomSheet(context);
                }
              },
              child: CircleAvatar(
                radius: 21,
                backgroundColor: Colors.white.withValues(alpha: 0.1),
                child: Center(child: Icon(Icons.add, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 60),
        child: Column(
          children: [
            SelectPlanContainer(),
            SizedBox(height: 15),
            Expanded(
              child: Obx(() {
                if (controller.selectedContainer.value == 1) {
                  return GoalList();
                } else {
                  return AiGoalList();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
