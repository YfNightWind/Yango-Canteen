import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';
// import 'package:yangocanteen/main.dart';

Future showLoadingAnimation() async {
  return Dialog(
    child: LoadingIndicator(
      indicatorType: Indicator.pacman,
      color: Colors.orange,
    ),
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    elevation: 0,
  );
}
