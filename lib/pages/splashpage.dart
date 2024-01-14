import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/splashcontroller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splash.jpg'),
      ),
    );
  }
}
