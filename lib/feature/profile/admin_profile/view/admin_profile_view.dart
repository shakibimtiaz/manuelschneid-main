import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/const/icons_path.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/add_course_list/view/add_course_list_view.dart'
    show AddCourseListView;
import 'package:manuelschneid/feature/change_password/view/change_password_view.dart';
import 'package:manuelschneid/feature/edit_profile/view/edit_profile_view.dart';

import 'package:manuelschneid/feature/profile/admin_profile/controller/admin_profile_controller.dart';
import 'package:manuelschneid/feature/profile/widgets/login_type.dart'
    show LoginProfileContentContainer;

class AdminProfileView extends StatelessWidget {
  AdminProfileView({super.key});

  final AdminProfileController controller = Get.put(AdminProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 80, left: 14, right: 14, bottom: 10),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage(ImagePath.userImage2),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Stan Mcwong",
                style: globalTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "stanmcwong24@gmail.com",
                style: globalTextStyle(
                  color: Color(0xFFF1F2F6).withValues(alpha: 0.64),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              LoginProfileContentContainer(
                containerColor: Colors.white.withValues(alpha: 0.06),
                textColor: Colors.white,
                image: IconsPath.editProfile,
                avaterColor: AppColors.primaryColor,
                text: "Edit Profile",
                onTap: () {
                  Get.to(() => EditProfileView());
                },
              ),
              SizedBox(height: 18),
              LoginProfileContentContainer(
                containerColor: Colors.white.withValues(alpha: 0.06),
                textColor: Colors.white,
                image: IconsPath.lockIcon,
                avaterColor: AppColors.primaryColor,
                text: "Change Password",
                onTap: () {
                  Get.to(() => ChangePasswordView());
                },
              ),
              SizedBox(height: 18),
              LoginProfileContentContainer(
                containerColor: Colors.white.withValues(alpha: 0.06),
                textColor: Colors.white,
                image: IconsPath.courseList,
                avaterColor: AppColors.primaryColor,
                text: "Course List",
                onTap: () {
                  Get.to(() => AddCourseListView());
                },
              ),
              SizedBox(height: 18),
              LoginProfileContentContainer(
                containerColor: Color(0xFFFF4B4B),
                textColor: Colors.white,
                image: IconsPath.logout,
                text: "Logout",
                onTap: () {
                  Get.offAllNamed('/signinScreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
