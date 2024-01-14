import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/inventoryitemcontroller.dart';

class InventoryItem extends GetView<InventoryItemController> {
  const InventoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments[0],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Image.network(controller.image[Get.arguments[0]]!),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                'Available: ${controller.avail.value.toString()}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  Get.arguments[1] ? 'Add item' : 'Request item',
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton.filledTonal(
                      iconSize: 30,
                      onPressed: controller.decrement,
                      icon: const Icon(Icons.remove),
                    ),
                    Obx(
                      () => Text(
                        controller.request.value.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton.filledTonal(
                      iconSize: 30,
                      onPressed: controller.increment,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: controller.requestItem,
              child: Container(
                width: Get.width * 0.8,
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Text(
                  Get.arguments[1] ? 'Add item' : 'Request item',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
