import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

getProgressDialog() {
  return SpinKitFadingCircle(
    itemBuilder: (_, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );
}
