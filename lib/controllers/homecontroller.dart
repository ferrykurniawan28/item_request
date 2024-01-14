import 'package:get/get.dart';
import 'package:item_request/controllers/authcontroller.dart';
import 'package:item_request/controllers/firebasecontroller.dart';
import 'package:item_request/page.dart';

class HomeController extends GetxController {
  var name = ''.obs;
  var pending = 0.obs;
  var approved = 0.obs;
  var rejected = 0.obs;

  final db = Get.put(FirebaseController());
  final auth = Get.put(AuthController());

  @override
  void onInit() async {
    name.value = await db.getUsername(auth.uid());
    pending.value = await db.getuserRequestsPending(name.value);
    approved.value = await db.getuserRequestsApproved(name.value);
    rejected.value = await db.getuserRequestsRejected(name.value);
    super.onInit();
  }

  void logout() {
    auth.logout();
    Get.offAllNamed(Pages.login);
  }

  void gotoInventory() {
    Get.toNamed(Pages.inventorylist, arguments: false);
  }

  void gotoRequestStatus() {
    Get.toNamed(
      Pages.checkApproval,
      arguments: name.value,
    );
  }
}
