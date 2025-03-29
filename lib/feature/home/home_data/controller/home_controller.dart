import 'package:get/get.dart';
import 'package:manuelschneid/core/const/image_path.dart';

class HomeController extends GetxController {
  var items =
      [
        {
          "rating": "4.8",
          "description": "This is the first item",
          "image": ImagePath.homeImage,
        },
        {
          "title": "4.7",
          "description": "This is the second item",
          "image": ImagePath.homeImage,
        },
        {
          "title": "5.0",
          "description": "This is the third item",
          "image": ImagePath.homeImage,
        },
      ].obs;

  var selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}
