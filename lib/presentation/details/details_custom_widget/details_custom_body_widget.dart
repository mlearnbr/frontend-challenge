import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsCustomBodyWidget extends StatelessWidget {
  final String? image;
  const DetailsCustomBodyWidget({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        createRectTween: (begin, end) {
          return Tween(begin: begin, end: end);
        },
        tag: image!,
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
              bottom: 278,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: CachedNetworkImage(
                  width: Get.width,
                  imageUrl:
                      "https://starwars-visualguide.com/assets/img/characters/$image.jpg",
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
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            )
          ],
        ));
  }
}
