import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/shared/utils/app_assets.dart';
import 'package:swapi_app/src/presentation/home/home_controller.dart';
import 'package:swapi_app/src/presentation/home/widgets/listview_peoples.dart';
import 'package:swapi_app/src/presentation/global_widgets/loader_widget.dart';
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
                    child: Center(
                      child: Image.asset(
                        AppAssets.logo,
                        scale: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () {
                        if (controller.pageState.value == HomeState.loading) {
                          return const LoaderWidget();
                        } else if (controller.pageState.value ==
                            HomeState.error) {
                          return SizedBox(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Error fetching character list!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.initList();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  child: const Text(
                                    'Try again',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: [
                            SearchContainer(
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
                            controller.loadingFiltered
                                ? const LoaderWidget()
                                : Expanded(
                                    child: ListViewPeoples(
                                      isLoading: controller.loading,
                                      peoples: controller.query.isEmpty
                                          ? controller.peoples
                                          : controller.peoplesFiltered,
                                      scrollController:
                                          controller.scrollController,
                                    ),
                                  )
                          ],
                        );
                      },
                    ),
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
