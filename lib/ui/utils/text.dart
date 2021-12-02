import "package:flutter/material.dart";

List<Widget> splitText(String text, BuildContext context) {
  return text.split('\n').map(
    (i) {
      // for removing the single characters like numbers
      if (i.length > 2) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          width: MediaQuery.of(context).size.width,
          child: Text(
            i,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
      // }
    },
  ).toList();
}
