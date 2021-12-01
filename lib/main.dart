import 'package:flutter/material.dart';

import 'package:fooder/services/service_locator.dart';

import 'package:fooder/ui/screens/loader.dart';

void main() {
  setup();
  return runApp(
    const MaterialApp(
      title: "Food Treasure",
      home: Loader(),
    ),
  );
}
