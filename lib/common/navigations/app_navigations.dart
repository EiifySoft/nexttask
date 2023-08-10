import 'package:get/get.dart';
import 'package:task/common/routes/namedroutes.dart';

class AppNavigations {
  static void navigateToSignInView() {
    Get.offAllNamed(NamedRoutes.SIGNIN);
  }

  static void navigateToSignUpView() {
    Get.toNamed(NamedRoutes.SIGNUP);
  }

  static void navigateToEditProfileView() {
    Get.toNamed(NamedRoutes.EDITPROFILE);
  }

  static void navigateToSignUpProfileView() {
    Get.offAllNamed(NamedRoutes.SIGNUPPROFILE);
  }

  static void navigateToMainView() {
    Get.offAllNamed(NamedRoutes.MAIN);
  }

  static void navigateToBack() {
    Get.back();
  }
}
