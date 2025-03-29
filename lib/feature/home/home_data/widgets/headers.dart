import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/home/home_data/controller/home_controller.dart';

class Headers extends StatelessWidget {
  Headers({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70, left: 24, right: 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(ImagePath.userImage),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: globalTextStyle(color: Color(0xFF7E7D7C)),
              ),
              Text(
                "Hello Adam",
                style: globalTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Spacer(),
          Stack(
            children: [
              Image.asset(ImagePath.notification, width: 50),
              Positioned(
                left: 30,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primaryColor,
                  child: Center(
                    child: Text(
                      "5",
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
    );
  }
}
