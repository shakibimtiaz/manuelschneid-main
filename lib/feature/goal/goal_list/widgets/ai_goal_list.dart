import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/goal/goal_details/view/goal_details_view.dart';
import 'package:manuelschneid/feature/goal/containers/goal_list_containers.dart';
import 'package:manuelschneid/feature/goal/goal_list/controller/goal_controller.dart';

class AiGoalList extends StatelessWidget {
  AiGoalList({super.key});

  final GoalController controller = Get.find<GoalController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () {
              Get.to(() => GoalDetailsView());
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Boxing Drills Practice",
                      style: globalTextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Row(
                      spacing: 5,
                      children: [
                        GoalListContainers(text: "01-03-2025"),
                        GoalListContainers(text: "Boxing Drill"),
                        GoalListContainers(text: "5 Minute"),
                      ],
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Et lobortis diam pharetra et sed bibendum. In lectus quis eget ullamcorper. Mus in fusce quis sit fringilla laoreet sit...",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: globalTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
