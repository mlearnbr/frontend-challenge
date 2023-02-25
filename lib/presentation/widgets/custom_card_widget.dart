import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomWidgetCard extends StatelessWidget {
  final String imagem;
  const CustomWidgetCard({Key? key, required this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return HeroWidget(imagem: imagem);
        // }));
      },
      child: Container(
        height: 350,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [
            BoxShadow(blurRadius: 10),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  "https://starwars-visualguide.com/assets/img/characters/$imagem.jpg",
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
