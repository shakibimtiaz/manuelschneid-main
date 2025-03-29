import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:manuelschneid/feature/category_details/view/category_details_view.dart'
    show CategoryDetailsView;
import 'package:manuelschneid/feature/home/home_data/controller/home_controller.dart'
    show HomeController;
import 'package:manuelschneid/feature/home/see_all_new_training/view/see_all_new_training_view.dart';

class NewTreading extends StatelessWidget {
  NewTreading({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "New Training",
                style: globalTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.to(() => SeeAllNewTrainingView());
                },
                child: Text(
                  "see all",
                  style: globalTextStyle(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Obx(
          () => CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
            items:
                controller.items.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CategoryDetailsView());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            image: DecorationImage(
                              image: AssetImage(
                                item['image'] ?? ImagePath.homeImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.06,
                                      ),
                                      borderRadius: BorderRadius.circular(52),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.05,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppColors.primaryColor,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            item['rating'] ?? "4.5",
                                            style: globalTextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "Simple Biceps Workout only 5 mins",
                                        style: globalTextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(52),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Upper Body",
                                            style: globalTextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
