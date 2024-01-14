import 'package:get/get.dart';
import 'package:item_request/controllers/authcontroller.dart';
import 'package:item_request/controllers/firebasecontroller.dart';
import 'package:item_request/page.dart';

class InventoryItemController extends GetxController {
  Map<String, String> image = {
    'Wrench':
        'https://m.media-amazon.com/images/I/61GXgVF0fnL._AC_UF894,1000_QL80_.jpg',
    'Hammer': 'https://m.media-amazon.com/images/I/71JxuOqyiYL.jpg',
    'Screwdriver':
        'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQX5b6ZejZEwRnks6n4sKXY7UHK_GJdmutDCednAzv8UrZrDIAxSPMSMuVdMZn4m6UL',
    'Pliers':
        'https://m.media-amazon.com/images/I/61H653wGm4L._AC_UF1000,1000_QL80_.jpg',
    'Saw': 'https://i.ebayimg.com/images/g/F3oAAOSwkCNhdu69/s-l1600.jpg',
    'Drill':
        'https://www.dewalt.com/NAG/PRODUCT/IMAGES/HIRES/DCD798B/DCD798B_1.jpg?resize=530x530',
    'Screw':
        'https://m.media-amazon.com/images/I/61gZOMBb5ML._AC_UF1000,1000_QL80_.jpg',
  };
  var avail = 0.obs;
  var request = 0.obs;
  final String item = Get.arguments[0];

  final db = Get.put(FirebaseController());
  final auth = Get.put(AuthController());

  @override
  void onInit() async {
    avail.value = await db.getItem(item.toLowerCase());
    super.onInit();
  }

  void requestItem() async {
    if (request.value == 0) {
      return;
    }
    if (Get.arguments[1] == true) {
      await db.updateItem(item.toLowerCase(), request.value + avail.value);
      Get.snackbar(
        'Success',
        'Item added',
      );
      Get.offAllNamed(Pages.adminhome);
    } else {
      final String username = await db.getUsername(auth.uid());
      await db.requestItem(item.toLowerCase(), request.value, username);
      await db.updateItem(item.toLowerCase(), avail.value - request.value);
      // Get.toNamed(Pages.afterRequest);
      Get.snackbar(
        'Success',
        'Request success',
      );
      // Get.offAllNamed(Pages.afterRequest);
      Get.toNamed(Pages.afterRequest);
      // Get.back();
    }
  }

  void updateItem() {
    db.updateItem(item.toLowerCase(), avail.value - request.value);
  }

  void increment() {
    if (request.value < avail.value) {
      request.value++;
    }
    // request.value++;
  }

  void decrement() {
    if (request.value > 0) {
      request.value--;
    }
  }

  Stream streamItem(String item) {
    return db.streamItem(item);
  }
}
