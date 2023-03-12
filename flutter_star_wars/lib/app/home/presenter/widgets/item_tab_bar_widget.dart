import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_store.dart';

class ItemTabBarWidget extends StatefulWidget {
  final String tabBar;
  const ItemTabBarWidget({Key? key, required this.tabBar})
      : super(key: key);

  @override
  State<ItemTabBarWidget> createState() =>
      _ItemTabBarWidgetState();
}

class _ItemTabBarWidgetState
    extends State<ItemTabBarWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return InkWell(
        onTap: () {
          store.changeTabBar(widget.tabBar);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: Text(
                widget.tabBar,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: store.tabBarSelected ==
                            widget.tabBar
                        ? Colors.black
                        : Colors.black54),
              ),
            ),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: store.tabBarSelected == widget.tabBar ? Colors.amber[700]!
                      : Colors.transparent),
            )
          ],
        ),
      );
    });
  }
}
