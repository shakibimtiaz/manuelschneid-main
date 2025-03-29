import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitCircle;
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/app_colors.dart';
import 'package:manuelschneid/core/const/image_path.dart' show ImagePath;
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF242424),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.appImage, width: screenWidth * .9),
            SizedBox(height: 60),
            SpinKitCircle(color: AppColors.primaryColor, size: 50.0),
          ],
        ),
      ),
    );
  }
}
