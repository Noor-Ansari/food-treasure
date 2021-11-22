import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fooder/models/category.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:fooder/screens/categories.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      final categories = await CategoryService.fetchData();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Categories(categories: categories),
        ),
      );
    });
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.blue,
          size: 100.0,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
