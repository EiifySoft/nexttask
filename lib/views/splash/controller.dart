import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/views/splash/index.dart';

class SplashController extends GetxController {
  SplashController();
  final SplashState state = SplashState();
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    isUserPersisit();
  }

  Future<void> isUserPersisit() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (storage.read("uid") == FirebaseAuth.instance.currentUser?.uid &&
        storage.read("uid") != null) {
      AppNavigations.navigateToMainView();
    } else {
      AppNavigations.navigateToSignInView();
    }
  }
}
