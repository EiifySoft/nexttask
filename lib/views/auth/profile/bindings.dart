import 'package:get/get.dart';
import 'package:task/views/auth/profile/index.dart';

class SignUpProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpProfileController>(SignUpProfileController());
  }
}
