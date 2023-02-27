import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_controller.dart';
import 'details_custom_widget/details_custom_body_widget.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);
  static String routName = "/detils";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(controller.arguments[1]),
        centerTitle: true,
      ),
      body: GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (controller) {
          return SafeArea(
            child: DetailsCustomBodyWidget(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
