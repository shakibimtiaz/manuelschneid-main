import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllNewTrainingController extends GetxController {
  var searchController = TextEditingController();
  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}
