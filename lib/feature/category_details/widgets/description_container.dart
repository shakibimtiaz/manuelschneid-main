import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart' show AppColors;
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/category_details/controller/category_details_controller.dart';

class DescriptionContainer extends StatelessWidget {
  DescriptionContainer({super.key});

  final CategoryDetailsController controller =
      Get.find<CategoryDetailsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  "Simple Biceps Workout only 5 mins",
                  style: globalTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(52),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: AppColors.primaryColor),
                      SizedBox(width: 5),
                      Text(
                        "4.5",
                        style: globalTextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.68 * 0.4,
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Egestas urna tortor proin condimentum. Cras egestas viverra massa at id rutrum auctor ut suspendisse. Aliquet ac elit eget enim eu leo imperdiet tortor eget. Molestie non mauris arcu amet fusce justo enim. Purus sollicitudin platea nibh lacus mauris. Leo fermentum gravida rutrum nunc est ultrices facilisi neque nulla. Tellus nullam viverra ridiculus turpis gravida vitae aliquam dui cras.",
              textAlign: TextAlign.justify,

              style: globalTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
