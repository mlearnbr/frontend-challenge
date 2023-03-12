import 'package:flutter/material.dart';

class ItemContainerNameWidget extends StatefulWidget {
  final String name;
  const ItemContainerNameWidget({Key? key, required this.name})
      : super(key: key);

  @override
  State<ItemContainerNameWidget> createState() =>
      _ItemContainerNameWidgetState();
}

class _ItemContainerNameWidgetState
    extends State<ItemContainerNameWidget> {

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
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 24),
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
                child: Text(
                  key: key,
                  widget.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
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
