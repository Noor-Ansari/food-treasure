import "package:flutter/material.dart";

class CustomCard extends StatelessWidget {
  const CustomCard({required this.cardText, required this.cardImage, Key? key})
      : super(key: key);

  final String cardText;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(5.0),
      height: 200.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              cardImage,
              fit: BoxFit.fitWidth,
              height: 150.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              cardText,
              style: TextStyle(
                color: Colors.amberAccent[400],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
