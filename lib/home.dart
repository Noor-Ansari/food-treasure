import 'package:flutter/material.dart';
import 'package:fooder/categories.dart';
import "categories.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Fooder"),
          ),
          body: const Categories()),
    );
  }
}
