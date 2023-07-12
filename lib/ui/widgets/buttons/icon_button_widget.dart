import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.iconColor,
    required this.iconSize,
  });

  final void Function()? onTap;
  final String iconPath;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          iconColor,
          BlendMode.srcIn,
        ),
        width: 24.0,
      ),
    );
  }
}
