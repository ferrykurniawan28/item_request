import 'package:get/get.dart';
import 'package:item_request/controllers/logincontroller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
