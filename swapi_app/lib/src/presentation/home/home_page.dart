import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/shared/utils/app_assets.dart';
import 'package:swapi_app/src/presentation/home/home_controller.dart';
import 'package:swapi_app/src/presentation/home/widgets/listview_peoples.dart';
import 'package:swapi_app/src/presentation/home/widgets/loader_widget.dart';
import 'package:swapi_app/src/presentation/home/widgets/search_container.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AppAssets.background,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Image.asset(
                      AppAssets.logo,
                      scale: 2,
                    ),
                  ),
                  Obx(
                    () => controller.initLoading
                        ? const SizedBox()
                        : SearchContainer(
                            onPressed: () {
                              controller.textEditingController.clear();
                              controller.query.value = '';
                              FocusScope.of(context).unfocus();
                            },
                            controller: controller.textEditingController,
                            onChanged: (String text) {
                              controller.query.value = text;
                            },
                          ),
                  ),
                  Obx(
                    () {
                      if (controller.initLoading) {
                        return const LoaderWidget();
                      }
                      return Expanded(
                        child: Obx(
                          () {
                            return controller.loadingFiltered
                                ? const LoaderWidget()
                                : ListViewPeoples(
                                    isLoading: controller.loading,
                                    peoples: controller.query.isEmpty
                                        ? controller.peoples
                                        : controller.peoplesFiltered,
                                    scrollController:
                                        controller.scrollController,
                                  );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
