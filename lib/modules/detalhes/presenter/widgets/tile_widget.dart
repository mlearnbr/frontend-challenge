import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool visible;

  const TileWidget({
    super.key,
    required this.title,
    required this.value,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value,
              style: theme.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
