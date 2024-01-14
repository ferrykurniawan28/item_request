import 'package:get/get.dart';
import 'package:item_request/controllers/firebasecontroller.dart';

class CheckStatusController extends GetxController {
  final db = Get.put(FirebaseController());

  Stream streamUser() {
    return db.streamUserRequest(Get.arguments);
  }
}
