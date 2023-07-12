import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vz_app/ui/utils/app_theme.dart';

class TextIconButtonWidget extends StatelessWidget {
  const TextIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.text,
  });

  final void Function()? onPressed;
  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: AppTheme.secondaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                AppTheme.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
