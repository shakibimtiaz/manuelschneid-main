import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/image_path.dart' show ImagePath;
import 'package:manuelschneid/core/style/global_text_style.dart'
    show globalTextStyle;
import 'package:manuelschneid/feature/bottom_navbar/view/bottom_navbar_view.dart';

class GoalDetailsController extends GetxController {
  var text =
      "Lorem ipsum dolor sit amet consectetur. Commodo etiam id facilisis id arcu amet justo dolor tellus. Dui feugiat id duis leo dolor gravida in. Integer ut eu cras id at. Id a felis diam ultrices urna tortor morbi lacus. Vitae nunc risus pretium nec pellentesque. Ac et tempus risus aenean sed ac suspendisse pharetra. Volutpat justo eu sodales tellus enim volutpat purus. Adipiscing feugiat porttitor volutpat facilisis tincidunt nunc ornare. Cursus diam fermentum urna a tortor laoreet. Blandit eget vestibulum lectus felis dui. Enim odio at ultricies quam nisi. Sit velit sed velit sollicitudin dui a scelerisque diam ultricies.";

  //var countdownTime = 10.obs;

  RxInt countdownTime = 300.obs; // Example: 5 minutes (300 seconds)
  int totalTime = 300; // Store the initial total time

  /// Function to get formatted time in mm:ss
  String getFormattedTime() {
    int minutes = countdownTime.value ~/ 60;
    int seconds = countdownTime.value % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  /// Function to calculate progress
  double getProgress() {
    return (totalTime - countdownTime.value) / totalTime;
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
                  InkWell(
                    onTap: () {
                      Get.offAll(() => BottomNavbarView());
                    },
                    child: Container(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
