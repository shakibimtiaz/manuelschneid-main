import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/global_widegts/custom_buttom.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:manuelschneid/feature/category_details/widgets/description_container.dart'
    show DescriptionContainer;
import 'package:manuelschneid/feature/category_details/widgets/time_container.dart'
    show TimeContainer;
import 'package:video_player/video_player.dart';
import 'package:manuelschneid/feature/category_details/controller/category_details_controller.dart';

class CategoryDetailsView extends StatelessWidget {
  CategoryDetailsView({super.key});

  final CategoryDetailsController controller = Get.put(
    CategoryDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: AspectRatio(
                        aspectRatio:
                            controller.videoController.value.aspectRatio,
                        child: VideoPlayer(controller.videoController),
                      ),
                    ),
                    Center(
                      child: IconButton(
                        icon: Icon(
                          controller.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50,
                        ),
                        onPressed: controller.toggleVideoPlayback,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.32,
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.68,
                  decoration: BoxDecoration(
                    color: AppColors.appBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child:
                      controller.showCountdown.value
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  "Simple Biceps Workout only 5 mins",
                                  textAlign: TextAlign.center,
                                  style: globalTextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.countdown.value} sec",
                                style: globalTextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(96),
                                  minHeight: 50,
                                  value: controller.progress.value,
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                TimeContainer(),
                                SizedBox(height: 15),
                                DescriptionContainer(),
                                Spacer(),
                                CustomButtom(
                                  text: "Start Training",
                                  ontap: () {
                                    controller.startCountdown();
                                  },
                                ),
                              ],
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
