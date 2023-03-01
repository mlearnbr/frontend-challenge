import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:swapi_app/shared/utils/app_assets.dart';
import 'package:swapi_app/src/presentation/home/home_controller.dart';
import 'package:swapi_app/src/presentation/home/widgets/bottom_loader.dart';

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
        Scaffold(
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
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  height: 50,
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Search character',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.initLoading) {
                    return Center(
                      child: LoadingAnimationWidget.twoRotatingArc(
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                    );
                  }
                  return Expanded(
                    child: Stack(
                      children: [
                        Scrollbar(
                          thickness: 8,
                          thumbVisibility: true,
                          radius: const Radius.circular(10),
                          interactive: true,
                          trackVisibility: false,
                          controller: controller.scrollController,
                          child: ListView.builder(
                            controller: controller.scrollController,
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            itemCount: controller.peoples.length,
                            itemBuilder: (_, index) {
                              final people = controller.peoples[index];
                              return ListTile(
                                dense: true,
                                minVerticalPadding: 16,
                                horizontalTitleGap: 6,
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      people.name,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  'Birth year: ${people.birthYear ?? 'not specified'}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        BottomLoaderWidget(
                          isLoading: controller.loading,
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
