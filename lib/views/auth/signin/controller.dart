import 'package:get/get.dart';
import 'package:task/common/utils/index.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/views/auth/signin/index.dart';

class SignInController extends GetxController {
  SignInController();
  final SignInState state = SignInState();

  @override
  void onClose() {
    state.emailController.value.dispose();
    state.passwordController.value.dispose();
    super.onClose();
  }

  Future<void> signIn() async {
    if (state.emailController.value.text.isNotEmpty &&
        state.passwordController.value.text.isNotEmpty) {
      state.isLoading.value = true;
      await AuthService().signInWithEmailAndPassword(
          email: state.emailController.value.text,
          password: state.passwordController.value.text);
      state.isLoading.value = false;
    } else {
      AppSnackBar.errorSnackBar(
          title: "Error", message: "All fields are required.");
      state.isLoading.value = false;
    }
  }

  isPasswordVisibleToggle() {
    state.isPasswordVisible.value = !state.isPasswordVisible.value;
  }
}
