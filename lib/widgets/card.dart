import "package:flutter/material.dart";

class CustomCard extends StatelessWidget {
  const CustomCard({required this.cardText, required this.cardImage, Key? key})
      : super(key: key);

  final String cardText;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 200.0,
      // padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
        // color: Color.fromRGBO(51, 45, 45, 1.0),
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
            height: 150.0,
            width: MediaQuery.of(context).size.width * 0.45,
            // padding: const EdgeInsets.all(18.0),
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            child: Hero(
              tag: "dish-image-$cardText",
              child: Image.network(
                cardImage,
                fit: BoxFit.fitWidth,
                height: 150.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              cardText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromRGBO(223, 123, 11, 1),
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
}
