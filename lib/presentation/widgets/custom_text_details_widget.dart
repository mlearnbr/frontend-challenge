import 'package:flutter/material.dart';

class CustomTextDetailsWidget extends StatelessWidget {
  final String title;
  const CustomTextDetailsWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
