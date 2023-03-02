import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BottomLoaderWidget extends StatelessWidget {
  final bool isLoading;
  const BottomLoaderWidget({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - 20;
    return isLoading
        ? Positioned(
            left: width,
            bottom: 24,
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: LoadingAnimationWidget.twoRotatingArc(
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
