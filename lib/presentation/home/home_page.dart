import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_custom_widget/home_body_custom_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  static String routName = "/home";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(Get.find(), Get.find()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black.withAlpha(150),
            ),
            backgroundColor: Colors.black,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: controller.filterOfFilms.isNotEmpty
                ? CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      onPressed: () {
                        controller.cleanListFilter();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    ))
                : Container(),
            body: controller
                .obx((state) => HomeBodyCustomWidget(controller: controller)),
          );
        });
  }
}
