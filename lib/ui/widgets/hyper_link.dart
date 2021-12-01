import "package:flutter/material.dart";
import 'package:flutter/gestures.dart';

import 'package:url_launcher/url_launcher.dart';

class HyperLink extends StatelessWidget {
  final String url;
  final String text;
  const HyperLink({required this.url, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 16,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            if (await canLaunch(url)) {
              launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
      ),
    );
  }
}
