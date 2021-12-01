import "package:flutter/material.dart";

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height,
      child: const SpinKitWave(
        color: Color.fromRGBO(223, 123, 11, 1),
        size: 60.0,
        duration: Duration(seconds: 1),
      ),
    );
  }
}
