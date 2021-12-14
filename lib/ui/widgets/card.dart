import "package:flutter/material.dart";

import "package:cached_network_image/cached_network_image.dart";

import 'package:food_treasure/constants/color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.cardText, required this.cardImage, Key? key})
      : super(key: key);

  final String cardText;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 220.0,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(51, 45, 45, 0.25),
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            child: Hero(
              tag: "dish-image-$cardText",
              child: image(cardImage),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              cardText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  CachedNetworkImage image(String cardImage) {
    return CachedNetworkImage(
      imageUrl: cardImage,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(40.0),
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.fitWidth,
      height: 150.0,
    );
  }
}
