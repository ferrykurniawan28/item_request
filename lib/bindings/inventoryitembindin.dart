import 'package:get/get.dart';
import 'package:item_request/controllers/inventoryitemcontroller.dart';

class InventoryItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventoryItemController());
  }
}
