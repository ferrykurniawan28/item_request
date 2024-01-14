import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/firebasecontroller.dart';
import 'package:item_request/page.dart';

class InventoryListController extends GetxController {
  var wrench = 0.obs;
  var hammer = 0.obs;
  var screwdriver = 0.obs;
  var pliers = 0.obs;
  var saw = 0.obs;
  var drill = 0.obs;
  var screw = 0.obs;
  // bool admin = false;

  final db = Get.put(FirebaseController());
  // final auth = Get.put(AuthController());

  Map<String, int> get inventory => {
        'Wrench': wrench.value,
        'Hammer': hammer.value,
        'Screwdriver': screwdriver.value,
        'Pliers': pliers.value,
        'Saw': saw.value,
        'Drill': drill.value,
        'Screw': screw.value,
      };

  @override
  void onInit() async {
    await updateInventoryItems();
    // admin = auth.isAdmin();
    // print(inventory);
    super.onInit();
  }

  Stream streamInventory() {
    return db.streamInventory();
  }

  Future<void> updateInventoryItems() async {
    wrench.value = await db.getItem('wrench');
    hammer.value = await db.getItem('hammer');
    screwdriver.value = await db.getItem('screwdriver');
    pliers.value = await db.getItem('pliers');
    saw.value = await db.getItem('saw');
    drill.value = await db.getItem('drill');
    screw.value = await db.getItem('screw');
    update();
  }

  void gotoItem(String item) {
    Get.toNamed(Pages.inventoryitem, arguments: [item, Get.arguments]);
  }

  TextButton button(
    String item,
  ) {
    return TextButton(
      onPressed: () {
        // if (inventory[item] == 0) {
        //   return;
        // }
        gotoItem(item);
      },
      child: Text((Get.arguments) ? 'Edit' : 'Request'),
      // 'Request',
      // (inventory[item] == 0) ? 'Out of stock' : 'Request',
    );
  }
}
