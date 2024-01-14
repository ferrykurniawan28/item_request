import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/page.dart';

class AfterRequestPage extends StatelessWidget {
  const AfterRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Request sent!',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Get.offAllNamed(Pages.home),
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                child: const Text(
                  'Back to home',
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
