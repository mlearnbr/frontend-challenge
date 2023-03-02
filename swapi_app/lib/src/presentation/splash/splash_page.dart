import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:swapi_app/src/presentation/splash/index.dart';
import 'package:swapi_app/shared/utils/app_assets.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadToPage();
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AppAssets.background,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Image.asset(
                    AppAssets.logo,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LoadingAnimationWidget.twoRotatingArc(
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
