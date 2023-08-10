import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpState {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isVerifyPasswordVisible = false.obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> verifyPasswordController =
      TextEditingController().obs;
}
