import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vz_app/ui/app.dart';
import 'package:vz_app/ui/pages/splash_page.dart';

void main() async {
  final runTime = Stopwatch();
  runTime.start();
  log("App start");

  runApp(const SplashPage());

  await Hive.initFlutter();
  await Hive.openBox("phrases");

  runApp(const VzApp());

  runTime.stop();
  log("${runTime.elapsed.inMilliseconds}ms to run app");
}
