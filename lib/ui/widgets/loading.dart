import "package:flutter/material.dart";

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final bool atCenter;
  const Loading({Key? key, required this.atCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: atCenter
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height * 0.35,
      child: const SpinKitWave(
        color: Color.fromRGBO(223, 123, 11, 1),
        size: 60.0,
        duration: Duration(seconds: 1),
      ),
    );
  }
}
