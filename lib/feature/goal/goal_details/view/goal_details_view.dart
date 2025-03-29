import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/goal/containers/goal_list_containers.dart'
    show GoalListContainers;
import 'package:manuelschneid/feature/goal/goal_details/controller/goal_details_controller.dart';

class GoalDetailsView extends StatelessWidget {
  GoalDetailsView({super.key});

  final GoalDetailsController controller = Get.put(GoalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(
          "Boxing Drill Practice",
          style: globalTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF1F2F6),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              radius: 21,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                GoalListContainers(text: "01-03-2025"),
                GoalListContainers(text: "Boxing Drill"),
                GoalListContainers(text: "5 Minute"),
              ],
            ),
            SizedBox(height: 15),
            Text(
              controller.text,
              textAlign: TextAlign.justify,
              style: globalTextStyle(fontWeight: FontWeight.w400),
            ),
            Spacer(),
            CustomButtom(
              text: "Start Training",
              ontap: () {
                _showBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Timer? timer;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black.withValues(alpha: 0.8),
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) {
        timer = Timer.periodic(Duration(seconds: 1), (t) {
          if (controller.countdownTime.value > 0) {
            controller.countdownTime.value--;
          } else {
            t.cancel();
            Get.back();
            controller.showCompletionDialog(context);
          }
        });

        return Obx(() {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Simple Biceps Workout only 5 mins",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    controller.getFormattedTime(), // Display formatted time
                    style: globalTextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 10),

                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(96),
                    minHeight: 50,
                    value:
                        controller.getProgress().isNaN
                            ? 0.0
                            : controller.getProgress(),
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Remaining",
                    style: globalTextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    ).whenComplete(() => timer?.cancel());
  }
}
