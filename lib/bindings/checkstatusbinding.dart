import 'package:get/get.dart';
import 'package:item_request/controllers/checkstatuscontroller.dart';

class CheckStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckStatusController());
  }
}
