import 'package:flutter/material.dart';

import '../../../src/model/model_response_people.dart';
import '../../widgets/custom_card_widget.dart';
import '../home_controller.dart';

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
                ResultCharacter starWars = controller.resultCharacter[index];

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
          PageView.builder(
              itemCount: 8,
              controller: controller.innerPageController,
              onPageChanged: (index) {
                controller.pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn);
                controller.currentIndeX(index);
              },
              itemBuilder: (context, index) {
                ResultCharacter starWars = controller.resultCharacter[index];
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
                          imagem: controller.idCharacter.toString())),
                );
              }),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: const NetworkImage(
                      "https://i.ibb.co/xgwkhVb/740922.png",
                    ),
                  ),
                  title: const Text("Personagem"),
                  subtitle: const Text(""),
                  trailing: SizedBox(
                    width: 120.0,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 12.0,
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 9.0,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 12.0,
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 9.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
