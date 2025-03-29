import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SeeAllTrainingCategoryController extends GetxController {
  var searchController = TextEditingController();
  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}
