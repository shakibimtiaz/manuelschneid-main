import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/feature/coach/view/coach_view.dart'
    show CoachView;
import 'package:manuelschneid/feature/goal/goal_list/view/goal_view.dart'
    show GoalView;
import 'package:manuelschneid/feature/home/home_data/view/home_view.dart'
    show HomeView;
import 'package:manuelschneid/feature/home/see_all_training_category/view/see_all_training_category_view.dart'
    show SeeAllTrainingCategoryView;
import 'package:manuelschneid/feature/profile/admin_profile/view/admin_profile_view.dart'
    show AdminProfileView;

import 'package:manuelschneid/feature/profile/user_profile/view/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class BottomNavbarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  Widget getCurrentScreen() {
    switch (selectedIndex.value) {
      case 0:
        return HomeView();
      case 1:
        return SeeAllTrainingCategoryView();
      case 2:
        return CoachView();
      case 3:
        return GoalView();
      case 4:
        if (userType.value == 'admin') {
          return AdminProfileView();
        } else {
          return ProfileView();
        }

      default:
        return HomeView();
    }
  }

  var userType = ''.obs;
  Future<void> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userType.value = prefs.getString('userType') ?? '';
    if (kDebugMode) {
      print('User Type: ${userType.value}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserType();
  }
}
