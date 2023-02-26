import 'package:flutter/material.dart';

class CustomListFilmsByPeople extends StatelessWidget {
  const CustomListFilmsByPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: const Center(
        child: Text(
          "Menu ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
