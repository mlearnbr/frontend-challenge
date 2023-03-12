import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_store.dart';

class ItemContainerFilterSelectedWidget extends StatefulWidget {
  final String filterSelected;
  const ItemContainerFilterSelectedWidget(
      {Key? key, required this.filterSelected})
      : super(key: key);

  @override
  State<ItemContainerFilterSelectedWidget> createState() =>
      _ItemContainerFilterSelectedWidgetState();
}

class _ItemContainerFilterSelectedWidgetState
    extends State<ItemContainerFilterSelectedWidget> {
  final HomeStore store = Modular.get();

  GlobalKey key = LabeledGlobalKey("key_itemtab");
  double width = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      setState(() {
        width = getSize() + 48;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
          width: width,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2, 8),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  key: key,
                  children: [
                    Text(
                      widget.filterSelected,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () async {
                        store.setLoading(true);
                        await Future.delayed(const Duration(seconds: 1));
                        store.filmSelected = null;
                        store.setLoading(false);
                      },
                      child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.close,
                            size: 12,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          )),
    );
  }

  double getSize() {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.width;
  }
}
