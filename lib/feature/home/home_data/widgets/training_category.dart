import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/home/home_data/controller/home_controller.dart'
    show HomeController;
import 'package:manuelschneid/feature/home/home_data/data_lists/training_category_lists.dart'
    show TrainingCategoryLists;
import 'package:manuelschneid/feature/home/see_all_training_category/view/see_all_training_category_view.dart'
    show SeeAllTrainingCategoryView;

class TrainingCategory extends StatelessWidget {
  TrainingCategory({super.key});

  final HomeController controller = Get.find<HomeController>();

  final List<String> tabTexts = ["All", "Boxing", "Upper Body", "Lower Body"];

  final List<Widget> tabWidgets = [
    TrainingCategoryLists(),
    TrainingCategoryLists(),
    TrainingCategoryLists(),
    TrainingCategoryLists(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Ensure a finite height
      height:
          MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Training Category",
                  style: globalTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(() => SeeAllTrainingCategoryView());
                  },
                  child: Text(
                    "See all",
                    style: globalTextStyle(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SingleChildScrollView(
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
                        margin: EdgeInsets.only(right: 10),
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
          ),
          SizedBox(height: 20),
          Expanded(
            child: Obx(() => tabWidgets[controller.selectedIndex.value]),
          ),
        ],
      ),
    );
  }
}
