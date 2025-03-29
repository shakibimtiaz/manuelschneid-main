import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/add_course_list/controller/add_course_list_controller.dart';
import 'package:manuelschneid/feature/add_course_list/widgets/all_course_list.dart'
    show AllCourseList;
import 'package:manuelschneid/feature/add_course_list/widgets/show_dialog.dart'
    show chooseAddCourseDialog;

class AddCourseListView extends StatelessWidget {
  AddCourseListView({super.key});

  final AddCourseListController controller = Get.put(AddCourseListController());

  final List<String> tabTexts = ["All", "Boxing", "Upper Body", "Lower Body"];

  final List<Widget> tabWidgets = [
    AllCourseList(),
    AllCourseList(),
    AllCourseList(),
    AllCourseList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              radius: 21,
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Course List",
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
                chooseAddCourseDialog();
              },
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.1),
                radius: 21,
                child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
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
