import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/homeadmincontroller.dart';

class AdminPage extends GetView<HomeAdminController> {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
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
            const Text(
              'Welcome, Admin!',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: controller.gotoInventory,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                child: const Text(
                  'Check inventory',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.gotoCheckRequest,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                child: const Text(
                  'Check requests',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
