import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

class EditProfileController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController.text = "Stan Mcwong";
    emailController.text = "stanmcwong24@gmail.com";
  }

  final ImagePicker _picker = ImagePicker();

  var selectedImageFile = Rxn<XFile>();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImageFile.value = image; // Store the XFile
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
