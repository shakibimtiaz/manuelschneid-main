import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/image_path.dart' show ImagePath;
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/category_details/view/category_details_view.dart'
    show CategoryDetailsView;
import 'package:manuelschneid/feature/home/see_all_training_category/controller/see_all_training_category_controller.dart';

class SeeAllTrainingCategoryDataList extends StatelessWidget {
  SeeAllTrainingCategoryDataList({super.key});

  final SeeAllTrainingCategoryController controller =
      Get.find<SeeAllTrainingCategoryController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 15.0, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(() => CategoryDetailsView());
            },
            child: Container(
              width: double.infinity,
              height: 204,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                  image: AssetImage(ImagePath.trainingCategory),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(52),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.05),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: AppColors.primaryColor),
                              SizedBox(width: 5),
                              Text(
                                "4.5",
                                style: globalTextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 230,
                          child: Text(
                            "Simple Biceps Workout only 5 mins",
                            style: globalTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 82,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Upper Body",
                                style: globalTextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
