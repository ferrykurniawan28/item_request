import 'package:get/get.dart';
import 'package:item_request/bindings/checkrequestbinding.dart';
import 'package:item_request/bindings/checkstatusbinding.dart';
import 'package:item_request/bindings/hombinding.dart';
import 'package:item_request/bindings/homeadminbinding.dart';
import 'package:item_request/bindings/inventoryitembindin.dart';
import 'package:item_request/bindings/inventorylistbinding.dart';
import 'package:item_request/bindings/loginbinding.dart';
import 'package:item_request/bindings/splashbinding.dart';
import 'package:item_request/page.dart';
import 'package:item_request/pages/adminpage.dart';
import 'package:item_request/pages/afterrequestpage.dart';
import 'package:item_request/pages/checkrequestpage.dart';
import 'package:item_request/pages/checkstatus.dart';
import 'package:item_request/pages/homepage.dart';
import 'package:item_request/pages/inventoryitempage.dart';
import 'package:item_request/pages/listinventorypage.dart';
import 'package:item_request/pages/loginpage.dart';
import 'package:item_request/pages/splashpage.dart';

class Routes {
  static final pages = [
    GetPage(
      name: Pages.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Pages.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Pages.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Pages.inventorylist,
      page: () => const InventoryList(),
      arguments: Get.arguments,
      binding: InventoryListBinding(),
    ),
    GetPage(
      name: Pages.inventoryitem,
      page: () => const InventoryItem(),
      arguments: Get.arguments,
      binding: InventoryItemBinding(),
    ),
    GetPage(
      name: Pages.afterRequest,
      page: () => const AfterRequestPage(),
    ),
    GetPage(
      name: Pages.adminhome,
      page: () => const AdminPage(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: Pages.requestlist,
      page: () => const CheckRequest(),
      binding: CheckRequestBinding(),
    ),
    GetPage(
      name: Pages.checkApproval,
      page: () => const CheckStatus(),
      arguments: Get.arguments,
      binding: CheckStatusBinding(),
    ),
  ];
}
