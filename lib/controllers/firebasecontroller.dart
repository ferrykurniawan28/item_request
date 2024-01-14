import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:item_request/controllers/authcontroller.dart';

class FirebaseController extends GetxController {
  // final auth = Get.lazyPut(() => AuthController());
  final db = FirebaseFirestore.instance;

  Future<void> createAccount(String username, String email, String password,
      String uid, int phone) async {
    await db.collection('users').doc(uid).set({
      'username': username,
      'email': email,
      'password': password,
      'phone': phone
    });
  }

  Future<String> getUsername(String uid) async {
    final doc = await db.collection('users').doc(uid).get();
    return doc['username'];
  }

  Future<int> getItem(String item) async {
    final data = await db.collection('inventory').doc(item).get();
    return data['quantity'];
  }

  Future<void> requestItem(String item, int quantity, String username) async {
    await db.collection('requests').add({
      'username': username,
      'item': item,
      'quantity': quantity,
      'status': 'Pending',
    });
  }

  Future<void> approveRequest(String username, String id) async {
    await db.collection('requests').doc(id).update({
      'status': 'Approved',
    });
  }

  Future<void> rejectRequest(String username, String id) async {
    await db.collection('requests').doc(id).update({
      'status': 'Rejected',
    });
  }

  Future<void> deleteRequest(String username, String id) async {
    await db.collection('requests').doc(id).delete();
  }

  Future<void> updateItem(String item, int quantity) async {
    await db.collection('inventory').doc(item).update({
      'quantity': quantity,
    });
  }

  Future<int> getuserRequestsPending(String username) async {
    final data = await db
        .collection('requests')
        .where('username', isEqualTo: username)
        .where('status', isEqualTo: 'Pending')
        .get();
    return data.docs.length;
  }

  Future<int> getuserRequestsApproved(String username) async {
    final data = await db
        .collection('requests')
        .where('username', isEqualTo: username)
        .where('status', isEqualTo: 'Approved')
        .get();
    return data.docs.length;
  }

  Future<int> getuserRequestsRejected(String username) async {
    final data = await db
        .collection('requests')
        .where('username', isEqualTo: username)
        .where('status', isEqualTo: 'Rejected')
        .get();
    return data.docs.length;
  }

  Stream<QuerySnapshot> streamInventory() {
    return db.collection('inventory').snapshots();
  }

  Stream streamItem(String item) {
    return db.collection('inventory').doc(item).snapshots().map((event) {
      return event['quantity'];
    });
  }

  Stream<QuerySnapshot> streamRequests() {
    return db.collection('requests').snapshots();
  }

  Stream<QuerySnapshot> streamUserRequest(String username) {
    return db
        .collection('requests')
        .where('username', isEqualTo: username)
        .snapshots();
  }
}
