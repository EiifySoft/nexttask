import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/models/index.dart';
import 'package:task/views/home/index.dart';
import 'package:task/views/profile/view.dart';

class MainState {
  RxInt currentIndex = 0.obs;
  StreamSubscription<DocumentSnapshot>? currentUserSubsription;
  Rx<UserModel> currentUserData = UserModel().obs;

  RxList<Widget> views = <Widget>[
    const HomeView(),
    const ProfileView(),
  ].obs;
}
