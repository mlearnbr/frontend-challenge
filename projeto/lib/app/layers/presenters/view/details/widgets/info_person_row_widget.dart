import 'package:flutter/material.dart';

class InfoPersonRow extends StatelessWidget {
  const InfoPersonRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
