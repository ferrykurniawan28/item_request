import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homecontroller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Text(
                'Welcome, ${controller.name}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            // const SizedBox(height: 20),
            Image.asset(
              'assets/splash.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              // padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Pending'),
                  ),
                  DataColumn(
                    label: Text('Approved'),
                  ),
                  DataColumn(
                    label: Text('Rejected'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Obx(
                            () => Text(
                              controller.pending.value.toString(),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Obx(
                            () => Text(
                              controller.approved.toString(),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Obx(
                            () => Text(
                              controller.rejected.value.toString(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: controller.gotoInventory,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: const Text(
                  'Check inventory',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.gotoRequestStatus,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: const Text(
                  'Check requests',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
