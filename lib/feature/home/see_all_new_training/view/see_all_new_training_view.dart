import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/feature/home/see_all_new_training/controller/see_all_new_training_controller.dart';
import 'package:manuelschneid/feature/home/see_all_new_training/data_list/see_all_new_training_data_list.dart'
    show SeeAllNewTrainingDataList;

class SeeAllNewTrainingView extends StatelessWidget {
  SeeAllNewTrainingView({super.key});

  final SeeAllNewTrainingController controller = Get.put(
    SeeAllNewTrainingController(),
  );

  final List<String> tabTexts = ["All", "Boxing", "Upper Body", "Lower Body"];

  final List<Widget> tabWidgets = [
    SeeAllNewTrainingDataList(),
    SeeAllNewTrainingDataList(),
    SeeAllNewTrainingDataList(),
    SeeAllNewTrainingDataList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: List.generate(tabTexts.length, (index) {
                    bool isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectTab(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 20,
                        ),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.primaryColor
                                  : Color(0xFF313131),
                          borderRadius: BorderRadius.circular(83),
                        ),
                        child: Text(
                          tabTexts[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => tabWidgets[controller.selectedIndex.value]),
            ),
          ],
        ),
      ),
    );
  }
}
