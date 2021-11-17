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
  final CategoriesResponse instance = CategoriesResponse();

  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.blue,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    instance.fetchData();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Categories(categories: instance.categories),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: spinkit,
      ),
    );
  }
}
