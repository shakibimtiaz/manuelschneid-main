import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/feature/home/home_data/controller/home_controller.dart'
    show HomeController;
import 'package:manuelschneid/feature/home/home_data/widgets/headers.dart'
    show Headers;
import 'package:manuelschneid/feature/home/home_data/widgets/new_treading.dart'
    show NewTreading;
import 'package:manuelschneid/feature/home/home_data/widgets/training_category.dart'
    show TrainingCategory;

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Headers(),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NewTreading(),
                    SizedBox(height: 40),
                    TrainingCategory(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
