import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/loader.dart';

void main() {
  return runApp(
    MaterialApp(
      title: "Food Treasure",
      theme: ThemeData(primaryColor: const Color.fromRGBO(51, 45, 45, 1.0)),
      home: const Loader(),
    ),
  );
}
