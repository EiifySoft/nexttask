import 'package:get/get.dart';
import 'package:task/views/home/index.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
