import 'package:flutter/material.dart';

class HeadTitleHome extends StatelessWidget {
  const HeadTitleHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 100,
      constraints: const BoxConstraints(minHeight: 80, maxHeight: 150),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
              child: Image.asset(
            'assets/Star_Wars_Logo.png',
          )),
          const SizedBox(width: 16),
          Expanded(
            flex: 4,
            child: Text(
              'Learn more about your favorite Star Wars character',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
