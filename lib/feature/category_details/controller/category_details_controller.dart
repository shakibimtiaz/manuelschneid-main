import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/image_path.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class CategoryDetailsController extends GetxController {
  late VideoPlayerController videoController;
  RxBool isPlaying = false.obs;
  RxBool showCountdown = false.obs;
  RxInt countdown = 10.obs;
  RxDouble progress = 0.0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Initialize the video player
    videoController = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://res.cloudinary.com/dezfej6wq/video/upload/v1739612006/uploads/file.mp4',
        ),
      )
      ..initialize().then((_) {
        update(); // Ensure UI rebuilds after video initialization
        videoController.setLooping(true); // Video will loop
      });
  }

  // Toggle video play/pause
  void toggleVideoPlayback() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }
  }

  void startCountdown() {
    showCountdown.value = true;
    videoController.play();
    isPlaying.value = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
        progress.value = (10 - countdown.value) / 10;
      } else {
        timer.cancel();
        videoController.pause();
        isPlaying.value = false;
        showCompletionDialog(Get.context!);
      }
    });
  }

  void showCompletionDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          width:
              MediaQuery.of(context).size.width *
              0.9, // Set width to 90% of the screen
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.alertImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Congratulations! You finished This Challenge Earn 50 Points",
                style: globalTextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(ImagePath.badge, width: 295, height: 229),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withValues(alpha: 0.4),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImagePath.sunflower, width: 25),
                          SizedBox(width: 5),
                          Text(
                            "50 points",
                            style: globalTextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          "Done",
                          style: globalTextStyle(
                            color: Colors.black,
                            fontSize: 12,
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
  }

  @override
  void onClose() {
    videoController.dispose();
    _timer?.cancel();
    super.onClose();
  }

  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
