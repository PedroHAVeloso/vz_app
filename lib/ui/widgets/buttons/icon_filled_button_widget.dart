import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconFilledButtonWidget extends StatelessWidget {
  const IconFilledButtonWidget({
    super.key,
    required this.onPressed,
    required this.fillColor,
    required this.iconPath,
    required this.iconColor,
  });

  final void Function()? onPressed;
  final String iconPath;
  final Color iconColor, fillColor;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
