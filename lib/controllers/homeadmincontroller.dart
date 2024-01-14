import 'package:get/get.dart';
import 'package:item_request/controllers/authcontroller.dart';
import 'package:item_request/page.dart';

class HomeAdminController extends GetxController {
  final auth = Get.put(AuthController());

  void logout() {
    auth.logout();
    Get.offAllNamed(Pages.login);
  }

  void gotoInventory() {
    Get.toNamed(Pages.inventorylist, arguments: true);
  }

  void gotoCheckRequest() {
    Get.toNamed(Pages.requestlist);
  }
}
