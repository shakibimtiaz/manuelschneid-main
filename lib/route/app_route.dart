import 'package:get/get.dart';
import 'package:manuelschneid/feature/auth/forget_password/email_verification/view/forget_password_view.dart';
import 'package:manuelschneid/feature/auth/login/view/login_view.dart';
import 'package:manuelschneid/feature/auth/register/view/register_view.dart';
import 'package:manuelschneid/feature/splash_screen/screen/splash_screen.dart'
    show SplashScreen;

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String forgetPasswordScreen = '/forgetPasswordScreen';
  static String signupScreen = '/signupScreen';
  static String signinScreen = '/signinScreen';
  static String bottomNavbarScreen = '/bottomNavbarScreen';

  static String getSplashScreen() => splashScreen;
  static String getForgetPasswordScreen() => forgetPasswordScreen;
  static String getsignupScreen() => signupScreen;
  static String getsigninScreen() => signinScreen;
  static String getbottomNavbarScreen() => bottomNavbarScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: signupScreen, page: () => RegisterView()),
    GetPage(name: signinScreen, page: () => LoginView()),
    GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordView()),
  ];
}
