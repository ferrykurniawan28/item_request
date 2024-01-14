import 'package:get/get.dart';
import 'package:item_request/controllers/authcontroller.dart';
import 'package:item_request/page.dart';

class SplashController extends GetxController {
  final auth = Get.put(AuthController());
  bool islogin = false;

  @override
  void onInit() async {
    islogin = auth.isLoggedIn();
    checklogin();
    super.onInit();
  }

  void checklogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (islogin) {
      Get.offAllNamed(Pages.home);
    } else {
      Get.offAllNamed(Pages.login);
    }
  }
}
