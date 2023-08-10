import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/models/index.dart';

class EditProfileState {
  RxBool isLoading = false.obs;
  Rx<File?> imageFile = File("").obs;
  StreamSubscription<DocumentSnapshot>? currentUserSubsription;
  Rx<UserModel> currentUserData = UserModel().obs;

  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
}
