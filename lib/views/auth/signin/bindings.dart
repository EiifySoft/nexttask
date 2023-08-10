import 'package:get/get.dart';
import 'package:task/views/auth/signin/index.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }
}
