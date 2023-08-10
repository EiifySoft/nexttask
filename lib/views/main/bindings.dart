import 'package:get/get.dart';
import 'package:task/views/main/index.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
