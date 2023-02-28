import 'package:flutter/material.dart';

class LoadMoreWidget extends StatelessWidget {
  final void Function()? onTap;
  const LoadMoreWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          'Load More',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
