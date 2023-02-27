import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  static String routName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) => Center(
            child: Image.asset(
              "assets/Star_Wars.png",
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
