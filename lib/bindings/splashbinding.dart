import 'package:get/get.dart';
import 'package:item_request/controllers/splashcontroller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
