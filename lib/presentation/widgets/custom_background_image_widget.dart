import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBackgroundImageWidget extends StatelessWidget {
  final String imagem;
  const CustomBackgroundImageWidget({
    Key? key,
    required this.imagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://starwars-visualguide.com/assets/img/characters/$imagem.jpg",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
