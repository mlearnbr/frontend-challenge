import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_custom_widget/home_body_custom_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  static String routName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<HomeController>(
        init: HomeController(Get.find()),
        builder: (controller) => controller
            .obx((state) => HomeBodyCustomWidget(controller: controller)),
      ),
    );
  }
}
