import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/common/models/index.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/common/utils/index.dart';
import 'package:task/views/auth/profile/index.dart';

class SignUpProfileController extends GetxController {
  SignUpProfileController();
  final SignUpProfileState state = SignUpProfileState();
  final ImagePicker imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    subscribeToCurrentUser();
  }

  Future<void> clickImage() async {
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (pickedImage != null) {
      state.imageFile.value = File(pickedImage.path);
      AppNavigations.navigateToBack();
    } else {
      AppSnackBar.errorSnackBar(title: "Error", message: "No Image Selected");
    }
  }

  Future<void> pickImage() async {
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage != null) {
      state.imageFile.value = File(pickedImage.path);
      AppNavigations.navigateToBack();
    } else {
      AppSnackBar.errorSnackBar(title: "Error", message: "No Image Selected");
    }
  }

  Future<void> uploadProfilePic() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseStorage storage = FirebaseStorage.instance;
    try {
      state.isLoading.value = true;
      if (auth.currentUser == null) {
        AppSnackBar.errorSnackBar(
            title: "Error", message: "User Not Authenticated");
        return;
      }
      if (state.imageFile.value == null) {
        AppSnackBar.errorSnackBar(title: "error", message: "No Image Selected");
        return;
      }
      final userId = auth.currentUser?.uid;
      final storageRef = storage.ref().child('profile_photos/$userId.jpg');
      await storageRef.putFile(state.imageFile.value!);
      final url = await storageRef.getDownloadURL();
      await firestore.collection('Users').doc(auth.currentUser!.uid).update({
        'photoUrl': url,
      });
      state.isLoading.value = false;
      AppSnackBar.successSnackBar(
          title: "Success!", message: "Profile Photo Uploaded Successfully");
      AppNavigations.navigateToMainView();
    } catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
      state.isLoading.value = false;
    }
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

  Future<void> skipAndNavigateToMainView() async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'photoUrl':
            "https://images.unsplash.com/photo-1691156324497-099d74964d78?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
      });
      AppNavigations.navigateToMainView();
    } catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
