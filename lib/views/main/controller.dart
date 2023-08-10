import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task/common/models/index.dart';
import 'package:task/views/main/index.dart';

class MainController extends GetxController {
  MainController();
  final MainState state = MainState();

  @override
  void onInit() {
    super.onInit();
    subscribeToCurrentUser();
  }

  void subscribeToCurrentUser() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef =
        firestore.collection("Users").doc(auth.currentUser?.uid);
    state.currentUserSubsription =
        collectionRef.snapshots().listen((documentSnapshot) {
      state.currentUserData.value = UserModel.fromSnapshot(documentSnapshot);
    });
  }
}
