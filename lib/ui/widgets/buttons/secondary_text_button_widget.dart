import 'package:flutter/material.dart';
import 'package:vz_app/ui/utils/app_theme.dart';

class SecondaryTextButtonWidget extends StatelessWidget {
  const SecondaryTextButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: const BorderSide(
            width: 4.0,
            color: AppTheme.accentColor,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
