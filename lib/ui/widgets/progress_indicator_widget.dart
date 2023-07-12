import 'package:flutter/material.dart';
import 'package:vz_app/ui/utils/app_theme.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60.0,
      width: 60.0,
      child: CircularProgressIndicator(
        color: AppTheme.accentColor,
        strokeWidth: 5.0,
      ),
    );
  }
}
