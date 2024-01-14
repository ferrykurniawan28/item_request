import 'package:get/get.dart';
import 'package:item_request/controllers/homeadmincontroller.dart';

class HomeAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAdminController());
  }
}
