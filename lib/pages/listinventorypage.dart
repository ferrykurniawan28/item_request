import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/inventorylistcontroller.dart';

class InventoryList extends GetView<InventoryListController> {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory List'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text('Item'),
              ),
              DataColumn(
                label: Text('Avail'),
              ),
              DataColumn(
                label: Text('Action'),
              ),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('Wrench')),
                DataCell(
                  Center(
                    child: Obx(
                      () => Text(
                        controller.wrench.value.toString(),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  controller.button('Wrench'),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Screwdriver')),
                DataCell(
                  Center(
                    child: Obx(() => Text(
                          controller.screwdriver.value.toString(),
                        )),
                  ),
                ),
                DataCell(
                  controller.button('Screwdriver'),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Hammer')),
                DataCell(
                  Center(
                    child: Obx(
                      () => Text(
                        controller.hammer.value.toString(),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  controller.button('Hammer'),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Saw')),
                DataCell(
                  Center(
                    child: Obx(
                      () => Text(
                        controller.saw.value.toString(),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  controller.button('Saw'),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Drill')),
                DataCell(
                  Center(
                    child: Obx(
                      () => Text(
                        controller.drill.value.toString(),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  controller.button('Drill'),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Pliers')),
                DataCell(
                  Center(
                    child: Obx(
                      () => Text(
                        controller.pliers.value.toString(),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  controller.button('Pliers'),
                ),
              ]),
              DataRow(
                cells: [
                  const DataCell(Text('Screw')),
                  DataCell(
                    Center(
                      child: Obx(
                        () => Text(
                          controller.screw.value.toString(),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    controller.button('Screw'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
