import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/type_planets.dart';
import '../../widgets/custom_text_details_widget.dart';
import '../details_controller.dart';

class DetailsCustomBodyWidget extends StatelessWidget {
  final DetailsController controller;
  const DetailsCustomBodyWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int value = int.parse(controller.arguments[0]);
    return Hero(
        createRectTween: (begin, end) {
          return Tween(begin: begin, end: end);
        },
        tag: controller.arguments[0],
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: Image.asset(
                "assets/background.jpg",
                height: Get.height,
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: CachedNetworkImage(
                  width: Get.width,
                  height: Get.height / 1.8,
                  imageUrl:
                      "https://starwars-visualguide.com/assets/img/characters/${controller.arguments[0]}.jpg",
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextDetailsWidget(
                        title: "Name:${controller.arguments[1]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Birth: ${controller.arguments[2]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Eye Color: ${controller.arguments[3]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Gender: ${controller.arguments[4]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Hair Color: ${controller.arguments[5]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Height: ${controller.arguments[6]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Mass: ${controller.arguments[7]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Skin Color: ${controller.arguments[8]}",
                      ),
                      CustomTextDetailsWidget(
                        title: "Home world: ${setTypePlanets(value)}",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
