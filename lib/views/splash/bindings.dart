import 'package:get/get.dart';
import 'package:task/views/splash/index.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
