import 'package:get/get.dart';
import 'package:item_request/controllers/inventorylistcontroller.dart';

class InventoryListBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => InventoryListController());
    Get.put(InventoryListController());
  }
}
