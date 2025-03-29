import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class GoalController extends GetxController {
  var selectedContainer = 1.obs;
  void selectContainer(int containerId) {
    selectedContainer.value = containerId;
    if (kDebugMode) {
      print("The selected container's value is ${selectedContainer.value}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      print("The value of selected Container is ${selectedContainer.value}");
    }
  }

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var workoutTypeController = TextEditingController();
  var workoutTimer = TextEditingController();
  var workoutTimer2 = TextEditingController();
  var aiq1Controller = TextEditingController();
}
