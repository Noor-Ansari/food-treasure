import 'package:flutter/material.dart';

import 'dart:async';
import "package:flutter_spinkit/flutter_spinkit.dart";

import 'package:fooder/ui/screens/categories.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Categories(),
        ),
      );
    });
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Color.fromRGBO(223, 123, 11, 1),
          size: 100.0,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
