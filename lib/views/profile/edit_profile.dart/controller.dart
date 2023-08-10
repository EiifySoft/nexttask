import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/common/utils/index.dart';
import 'package:task/views/main/index.dart';
import 'package:task/views/profile/edit_profile.dart/index.dart';

class EditProfileController extends GetxController {
  EditProfileController();
  final EditProfileState state = EditProfileState();
  final ImagePicker imagePicker = ImagePicker();
  final mainController = Get.put<MainController>(MainController());

  @override
  void onInit() {
    super.onInit();
    state.usernameController.value.text =
        mainController.state.currentUserData.value.username!;
    state.emailController.value.text =
        mainController.state.currentUserData.value.email!;
    state.phoneController.value.text =
        mainController.state.currentUserData.value.phone!;
    state.passwordController.value.text =
        mainController.state.currentUserData.value.password!;
  }

  @override
  void onClose() {
    state.usernameController.value.dispose();
    state.emailController.value.dispose();
    state.phoneController.value.dispose();
    state.passwordController.value.dispose();
    super.onClose();
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
    } catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
      state.isLoading.value = false;
    }
  }

  Future<void> updateProfile() async {
    try {
      if (state.imageFile.value != null) {
        state.isLoading.value = true;
        await uploadProfilePic();
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "username": state.usernameController.value.text,
          "email": state.emailController.value.text,
          "phone": state.phoneController.value.text,
          "password": state.passwordController.value.text,
          'updatedAt': Timestamp.now(),
        });
        AppSnackBar.successSnackBar(
            title: "Updated.", message: "Profile updated successfully");
        state.isLoading.value = false;
      }
    } on FirebaseException catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
      state.isLoading.value = false;
    }
  }
}
