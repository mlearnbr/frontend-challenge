import 'package:flutter/material.dart';
import 'package:swapi_app/src/utils/app_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AppAssets.background,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(),
      ],
    );
  }
}
