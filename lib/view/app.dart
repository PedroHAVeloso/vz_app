import 'package:flutter/material.dart';
import 'package:vz_app/view/constants/app_theme.dart';
import 'package:vz_app/view/pages/home_page.dart';

class VzApp extends StatelessWidget {
  const VzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home: const HomePage(),
    );
  }
}
