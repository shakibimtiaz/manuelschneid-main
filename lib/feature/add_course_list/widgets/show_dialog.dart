import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/create_category/view/create_category_view.dart'
    show CreateCategoryView;
import 'package:manuelschneid/feature/create_training/view/create_training.dart'
    show CreateTraining;

void chooseAddCourseDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Color(0xFF181818),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width:
            MediaQuery.of(Get.context!).size.width * 0.9, // 90% of screen width
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => CreateCategoryView());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 26),
                    child: Center(
                      child: Text(
                        "Add Category",
                        style: globalTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(() => CreateTraining());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 26),
                    child: Center(
                      child: Text(
                        "Add Training",
                        style: globalTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
