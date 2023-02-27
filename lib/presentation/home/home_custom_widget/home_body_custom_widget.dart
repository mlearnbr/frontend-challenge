import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/type_specie.dart';
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
      padding: const EdgeInsets.only(top: 60),
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
              ? Get.width <= 820
                  ? CustomPageViewWidget(controller: controller)
                  : CustomGridViewWidget(controller: controller)
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
                          if (index >= 0) {
                            controller.idfilter = index;
                            controller.idfilter++;
                          }
                          ResultCharacter filter =
                              controller.filterOfFilms[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  child: Text(controller.idfilter.toString()),
                                ),
                                title: Text(filter.name),
                                subtitle: Text(filter.birthYear),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
          Positioned(
            top: 0,
            child: HomeHeaderCustomWidget(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}

class CustomPageViewWidget extends StatelessWidget {
  const CustomPageViewWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      bottom: 0,
      left: 0,
      right: 0,
      child: PageView.builder(
          itemCount: controller.resultCharacter.length,
          controller: controller.innerPageController,
          onPageChanged: (index) {
            if (index >= 0) {
              controller.idCharacter = index;
              controller.idCharacter++;
            }
            controller.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
            controller.currentIndeX(index);
          },
          itemBuilder: (context, index) {
            ResultCharacter starWars = controller.resultCharacter[index];

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
                  child: GestureDetector(
                    onTap: () {
                      controller.filterFilmByPeopleFilms(starWars.films);
                      String valueid = controller.idCharacter.toString();
                      Get.toNamed(DetailsPage.routName, arguments: [
                        valueid,
                        starWars.name,
                        starWars.birthYear,
                        starWars.eyeColor,
                        starWars.gender,
                        starWars.hairColor,
                        starWars.height,
                        starWars.mass,
                        starWars.skinColor,
                        starWars.homeworld,
                        setTypeSpecie(controller.idfilter),
                      ]);
                    },
                    child: CustomWidgetCard(
                      image: controller.idCharacter.toString(),
                      idCharacter: controller.idCharacter,
                      resultCharacter: starWars,
                    ),
                  )),
            );
          }),
    );
  }
}

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.resultCharacter.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width <= 1015 ? 2 : 3, childAspectRatio: 2 / 3),
        itemBuilder: (context, index) {
          ResultCharacter starWars = controller.resultCharacter[index];

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
                child: GestureDetector(
                  onTap: () {
                    controller.filterFilmByPeopleFilms(starWars.films);
                    String valueid = controller.idCharacter.toString();
                    Get.toNamed(DetailsPage.routName, arguments: [
                      valueid,
                      starWars.name,
                      starWars.birthYear,
                      starWars.eyeColor,
                      starWars.gender,
                      starWars.hairColor,
                      starWars.height,
                      starWars.mass,
                      starWars.skinColor,
                      starWars.homeworld,
                      setTypeSpecie(controller.idfilter),
                    ]);
                  },
                  child: CustomWidgetCard(
                    image: controller.idCharacter.toString(),
                    idCharacter: controller.idCharacter,
                    resultCharacter: starWars,
                  ),
                )),
          );
        });
  }
}
