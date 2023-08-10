import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task/common/models/index.dart';

class SignUpProfileState {
  RxBool isLoading = false.obs;
  Rx<File?> imageFile = File("").obs;
  StreamSubscription<DocumentSnapshot>? currentUserSubsription;
  Rx<UserModel> currentUserData = UserModel().obs;
}
