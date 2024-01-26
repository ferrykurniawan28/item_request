import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/firebasecontroller.dart';

class CheckRequestController extends GetxController {
  final db = Get.put(FirebaseController());
  // String username = '';

  Stream streamRequests() {
    return db.streamRequests();
  }

  Future<void> approveRequest(String username, String id) async {
    await db.approveRequest(username, id);
  }

  Future<void> rejectRequest(String username, String id) async {
    await db.rejectRequest(username, id);
  }

  void showdialog(String username, String id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Request Approval'),
        content: const Text('Are you sure you want to approve this request?'),
        actions: [
          TextButton(
            onPressed: () async {
              await rejectRequest(username, id);
              Get.snackbar(
                'Request Rejected',
                'Request has been rejected',
              );
              Get.back();
            },
            child: const Text('Reject'),
          ),
          TextButton(
            onPressed: () async {
              await approveRequest(username, id);
              Get.snackbar(
                'Request Approved',
                'Request has been approved',
              );
              Get.back();
            },
            child: const Text('Aprrove'),
          ),
        ],
      ),
    );
    // Get.defaultDialog(
    //   title: 'Request',
    //   content: const Text('Request has been sent'),
    //   textConfirm: 'OK',
    //   onConfirm: () {
    //     Get.back();
    //   },
    // );
  }
}
