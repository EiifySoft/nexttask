import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/common/utils/index.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GetStorage storage = GetStorage();
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      storage.write("uid", auth.currentUser?.uid);
      AppNavigations.navigateToSignUpProfileView();
    } on FirebaseAuthException catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      storage.write("uid", auth.currentUser?.uid);
      AppNavigations.navigateToMainView();
    } on FirebaseAuthException catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      storage.erase();
      AppNavigations.navigateToSignInView();
    } on FirebaseAuthException catch (e) {
      AppSnackBar.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
