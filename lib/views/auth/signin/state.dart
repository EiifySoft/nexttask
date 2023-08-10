import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInState {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
}
