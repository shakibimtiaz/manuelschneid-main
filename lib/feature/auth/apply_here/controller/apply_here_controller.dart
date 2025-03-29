import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

class ApplyHereController extends GetxController {
  RxString otp = ''.obs;
  void setOtp(String otpValue) {
    otp.value = otpValue;
    if (kDebugMode) {
      print("OTP entered: $otpValue");
    }
  }
}
