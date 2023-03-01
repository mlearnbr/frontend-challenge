import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/people_model.dart';
import '../films/films_page.dart';
import 'home_controller.dart';
import 'widgets/custom_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('STAR WARS'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              splashRadius: 27,
              highlightColor: Colors.yellow.shade300,
              icon: const Icon(
                size: 30,
                Icons.ondemand_video,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilmsPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Obx(
                  () => SizedBox(
                    height: constraints.maxHeight * 0.983,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      shrinkWrap: true,
                      controller: homeController.scrollController,
                      itemCount: homeController.peopleList.length + 1,
                      itemBuilder: ((context, index) {
                        if (index < homeController.peopleList.length) {
                          PeopleModel peopleModel =
                              homeController.peopleList[index];

                          if (homeController.peopleList.length > 1 &&
                              homeController.peopleList.length - 1 == index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomContainer(model: peopleModel),
                            );
                          } else if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomContainer(model: peopleModel),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomContainer(model: peopleModel),
                            );
                          }
                        } else {
                          return const Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.yellow,
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
