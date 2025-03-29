import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class CreateTrainingController extends GetxController {
  var courseTitleController = TextEditingController();
  var categoryController = TextEditingController();
  var curseDescriptionController = TextEditingController();
  var courseTimer = TextEditingController();
  var courseCoal = TextEditingController();

  var courseVideoController =
      "".obs; // Use RxString instead of TextEditingController

  Future<void> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null) {
      courseVideoController.value =
          result.files.single.name; // Update observable variable
    }
  }
}
