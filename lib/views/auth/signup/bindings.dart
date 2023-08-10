import 'package:get/get.dart';
import 'package:task/views/auth/signup/index.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
