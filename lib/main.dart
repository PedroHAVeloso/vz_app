import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vz_app/ui/app.dart';
import 'package:vz_app/ui/pages/splash_page.dart';

void main() async {
  final runTime = Stopwatch();
  runTime.start();
  log("App start");

  runApp(const SplashPage());

  await Future.delayed(const Duration(seconds: 2));

  runApp(const VzApp());

  runTime.stop();
  log("${runTime.elapsed.inMilliseconds}ms to run app");
}
