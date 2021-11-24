import "package:flutter/material.dart";

class CustomCard extends StatelessWidget {
  const CustomCard({required this.cardText, required this.cardImage, Key? key})
      : super(key: key);

  final String cardText;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
        color: Color.fromRGBO(51, 45, 45, 1.0),
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
            padding: const EdgeInsets.all(18.0),
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            child: Image.network(
              cardImage,
              fit: BoxFit.fitWidth,
              height: 150.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              cardText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
