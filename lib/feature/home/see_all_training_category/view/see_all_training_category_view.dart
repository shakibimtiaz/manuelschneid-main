import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/feature/home/see_all_training_category/controller/see_all_training_category_controller.dart'
    show SeeAllTrainingCategoryController;
import 'package:manuelschneid/feature/home/see_all_training_category/data_list/see_all_training_category_data_list.dart'
    show SeeAllTrainingCategoryDataList;
import 'package:manuelschneid/feature/home/see_all_training_category/widgets/see_all_custom_textfield.dart';

class SeeAllTrainingCategoryView extends StatelessWidget {
  SeeAllTrainingCategoryView({super.key});

  final SeeAllTrainingCategoryController controller = Get.put(
    SeeAllTrainingCategoryController(),
  );

  final List<String> tabTexts = ["All", "Boxing", "Upper Body", "Lower Body"];

  final List<Widget> tabWidgets = [
    SeeAllTrainingCategoryDataList(),
    SeeAllTrainingCategoryDataList(),
    SeeAllTrainingCategoryDataList(),
    SeeAllTrainingCategoryDataList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SeeAllCustomTextfield(
                controller: controller.searchController,
                hintText: "Search...",
              ),
            ),
            SizedBox(height: 20),
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
