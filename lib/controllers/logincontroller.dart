import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/authcontroller.dart';
import 'package:item_request/controllers/firebasecontroller.dart';
import 'package:item_request/page.dart';

class LoginController extends GetxController {
  RxBool register = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? username;

  final auth = Get.put(AuthController());
  final db = Get.put(FirebaseController());

  void changeRegister() {
    register.value = !register.value;
  }

  void submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (register.value) {
      final phone = int.parse(phoneController.text);
      auth.signup(
        emailController.text,
        passwordController.text,
        usernameController.text,
        phone,
      );
      Get.offAllNamed(Pages.home);
      Get.snackbar(
        'Success',
        'Signup success',
      );
    } else {
      auth.login(emailController.text, passwordController.text);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
