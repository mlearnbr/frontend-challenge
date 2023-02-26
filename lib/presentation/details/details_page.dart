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
      body: GetBuilder<DetailsController>(
        init: DetailsController(),
        builder: (controller) {
          return SafeArea(
            child: DetailsCustomBodyWidget(
              image: controller.arguments[0],
            ),
          );
        },
      ),
    );
  }
}
