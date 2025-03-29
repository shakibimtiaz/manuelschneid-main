import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/global_widegts/custom_text_field.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/add_course_list/view/add_course_list_view.dart';
import 'package:manuelschneid/feature/create_category/controller/create_category_controller.dart';

class CreateCategoryView extends StatelessWidget {
  CreateCategoryView({super.key});

  final CreateCategoryController controller = Get.put(
    CreateCategoryController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(
          "Create Category",
          style: globalTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            CustomTextField(
              verticalPadding: 20,
              controller: controller.categoryName,
              hintText: "Enter New Category Name",
            ),
            Spacer(),
            CustomButtom(
              contentPadding: 16,
              text: "Create Categoy",
              ontap: () {
                Get.offAll(() => AddCourseListView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
