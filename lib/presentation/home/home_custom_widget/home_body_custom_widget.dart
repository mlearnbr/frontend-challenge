import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/type_specie.dart';
import '../../../src/base_url/base_url_api.dart';
import '../../../src/model/model_response_people.dart';
import '../../details/details_page.dart';
import '../../widgets/custom_card_widget_widget.dart';
import '../home_controller.dart';
import 'home_header_custom_widget.dart';

class HomeBodyCustomWidget extends StatelessWidget {
  final HomeController controller;
  const HomeBodyCustomWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Stack(
        children: [
          PageView.builder(
              padEnds: false,
              itemCount: 8,
              controller: controller.pageController,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder<double>(
                    curve: Curves.ease,
                    duration: controller.duration,
                    tween: controller.currentIndex == index
                        ? Tween(begin: 2, end: 3)
                        : Tween(begin: 1, end: 1),
                    builder: (context, value, child) {
                      return Transform.scale(
                        alignment: Alignment.center,
                        scale: value,
                        child: child,
                      );
                    },
                    child: Image.asset("assets/background.jpg"));
              }),
          controller.filterOfFilms.length.isEqual(0)
              ? PageView.builder(
                  itemCount: 8,
                  controller: controller.innerPageController,
                  onPageChanged: (index) {
                    controller.pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                    controller.currentIndeX(index);
                  },
                  itemBuilder: (context, index) {
                    ResultCharacter starWars =
                        controller.resultCharacter[index];
                    controller.idCharacter = index;

                    if (index >= 0) {
                      controller.idCharacter++;
                    }
                    return Center(
                      child: TweenAnimationBuilder<double>(
                          curve: Curves.ease,
                          duration: controller.duration,
                          tween: controller.currentIndex == index
                              ? Tween(begin: 2, end: 1.7)
                              : Tween(begin: 1, end: 1),
                          builder: (context, value, child) {
                            return Transform.scale(
                              alignment: Alignment.center,
                              scale: value,
                              child: child,
                            );
                          },
                          child: CustomWidgetCard(
                            image: controller.idCharacter.toString(),
                            idCharacter: controller.idCharacter,
                            resultCharacter: starWars,
                          )),
                    );
                  })
              : Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.filterOfFilms.length,
                        itemBuilder: (context, index) {
                          ResultCharacter filter =
                              controller.filterOfFilms[index];
                          controller.idfilter = index;
                          if (index >= 0) {
                            controller.idfilter++;
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "$urlImg${controller.idfilter}.jpg",
                                  ),
                                ),
                                title: Text(filter.name),
                                subtitle: Text(filter.birthYear),
                                trailing: IconButton(
                                  onPressed: () {
                                    String valueid =
                                        controller.idfilter.toString();
                                    Get.toNamed(DetailsPage.routName,
                                        arguments: [
                                          valueid,
                                          filter.name,
                                          filter.birthYear,
                                          filter.eyeColor,
                                          filter.gender,
                                          filter.hairColor,
                                          filter.height,
                                          filter.mass,
                                          filter.skinColor,
                                          filter.homeworld,
                                          setTypeSpecie(controller.idfilter),
                                        ]);
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    size: 24.0,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
          HomeHeaderCustomWidget(
            controller: controller,
          )
        ],
      ),
    );
  }
}
