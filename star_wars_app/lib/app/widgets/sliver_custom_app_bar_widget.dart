import 'package:flutter/material.dart';

class SliverCustomAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(10.0),
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/sw_logo.png',
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
