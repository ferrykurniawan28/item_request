import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/firebasecontroller.dart';
import 'package:item_request/page.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firebaseC = Get.put(FirebaseController());

  bool isLoggedIn() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final admin = isAdmin();
      // print(admin);
      if (admin) {
        Get.offAllNamed(Pages.adminhome);
      } else {
        Get.offAllNamed(Pages.home);
      }
      Get.snackbar(
        'Success',
        'Login success',
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool isAdmin() {
    if (auth.currentUser!.email!.contains('@admin.com')) {
      return true;
    } else {
      return false;
    }
  }

  void signup(String email, String password, String username, int phone) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await firebaseC.createAccount(
        username,
        email,
        password,
        uid(),
        phone,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    auth.signOut();
    Get.offAllNamed(Pages.login);
  }

  String uid() {
    return auth.currentUser!.uid;
  }
}
