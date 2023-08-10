import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/common/models/index.dart';
import 'package:task/common/utils/index.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addUserData(
      {required String uid, required UserModel userModel}) async {
    final collection = firestore.collection("Users");
    final docRef = collection.doc(uid);
    final newUser = UserModel(
      id: userModel.id,
      username: userModel.username,
      email: userModel.email,
      phone: userModel.phone,
      photoUrl: userModel.photoUrl,
      password: userModel.password,
      isAdmin: userModel.isAdmin,
      isEngineer: userModel.isEngineer,
      isOnline: userModel.isOnline,
      createdAt: userModel.createdAt,
      updatedAt: userModel.updatedAt,
      lastSeen: userModel.lastSeen,
      provider: userModel.provider,
    ).toJson();

    try {
      await docRef.set(newUser);
    } on FirebaseException catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
