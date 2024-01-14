import 'package:get/get.dart';
import 'package:item_request/controllers/checkrequestcontroller.dart';

class CheckRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckRequestController());
  }
}
