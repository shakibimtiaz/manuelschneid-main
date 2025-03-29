import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/feature/bottom_navbar/view/bottom_navbar_view.dart'
    show BottomNavbarView;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var userType = ''.obs;

  Future<void> checkUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (emailController.text == 'admin@gmail.com' &&
        passwordController.text == '12345678') {
      userType.value = 'admin';
      Get.offAll(() => BottomNavbarView());
    } else {
      userType.value = 'user';
      Get.offAll(() => BottomNavbarView());
    }

    await prefs.setString('userType', userType.value);
  }
}
