import 'package:get/get.dart';
import 'package:task/views/profile/edit_profile.dart/controller.dart';

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }
}
