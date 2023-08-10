import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task/common/models/index.dart';
import 'package:task/common/utils/index.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/services/firestore_service.dart';
import 'package:task/views/auth/signup/index.dart';

class SignUpController extends GetxController {
  SignUpController();
  final SignUpState state = SignUpState();

  @override
  void onClose() {
    state.usernameController.value.dispose();
    state.emailController.value.dispose();
    state.phoneController.value.dispose();
    state.passwordController.value.dispose();
    state.verifyPasswordController.value.dispose();

    super.onClose();
  }

  isPasswordVisibleToggle() {
    state.isPasswordVisible.value = !state.isPasswordVisible.value;
  }

  isVerifyPasswordVisibleToggle() {
    state.isVerifyPasswordVisible.value = !state.isVerifyPasswordVisible.value;
  }

  Future<void> signup() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (state.usernameController.value.text.isNotEmpty &&
        state.emailController.value.text.isNotEmpty &&
        state.phoneController.value.text.isNotEmpty &&
        state.passwordController.value.text.isNotEmpty &&
        state.verifyPasswordController.value.text.isNotEmpty) {
      if (state.passwordController.value.text ==
          state.verifyPasswordController.value.text) {
        state.isLoading.value = true;
        await AuthService().createUserWithEmailAndPassword(
            email: state.emailController.value.text,
            password: state.passwordController.value.text);
        await FirestoreService().addUserData(
          uid: auth.currentUser!.uid,
          userModel: UserModel(
            id: auth.currentUser!.uid,
            username: state.usernameController.value.text,
            email: state.emailController.value.text,
            phone: state.phoneController.value.text,
            photoUrl: "",
            password: state.passwordController.value.text,
            isAdmin: false,
            isEngineer: false,
            isOnline: true,
            createdAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
            lastSeen: Timestamp.now(),
            provider: "EMAIL",
          ),
        );
        state.isLoading.value = false;
      } else {
        AppSnackBar.errorSnackBar(
            title: "Error", message: "Both password should be the same");
        state.isLoading.value = false;
      }
    } else {
      AppSnackBar.errorSnackBar(
          title: "Error", message: "All fields are required");
      state.isLoading.value = false;
    }
  }
}
