import 'package:flutter/material.dart';
import '../widgets/categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fooder"),
      ),
      body: const Categories(),
    );
  }
}
