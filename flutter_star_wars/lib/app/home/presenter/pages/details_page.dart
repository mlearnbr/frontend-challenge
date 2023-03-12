import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_star_wars/app/home/presenter/widgets/item_tab_bar_widget.dart';

import '../home_store.dart';
import '../widgets/item_container_name_widget.dart';
import '../widgets/tab_bar_films_widget.dart';
import '../widgets/tab_bar_info_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: Column(children: [
            Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 400,
                width: double.infinity,
                child: ItemContainerNameWidget(
                  name: store.characterSelected!.name,
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...['INFO', 'IN FILMS'].map((e) {
                        return ItemTabBarWidget(tabBar: e);
                      }).toList()
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Observer(builder: (_) {
                        if (store.tabBarSelected == 'INFO') {
                          return TabBarInfoWidget(
                            character: store.characterSelected!,
                          );
                        }
                        return const TabBarFilmsWidget();
                      }),
                    ),
                  ),
                ],
              ),
            )
          ]),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(24),
            child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2, 8),
                              blurRadius: 12)
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.black,
                        textDirection: TextDirection.rtl,
                        size: 22,
                      )),
                )),
          ),
        );
      }
    );
  }
}
