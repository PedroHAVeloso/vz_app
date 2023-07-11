import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vz_app/ui/constants/app_icons.dart';
import 'package:vz_app/ui/constants/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: SizedBox(
          height: preferredSize.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/logos/logo_colour_dark.svg',
                width: 100.0,
              ),
              Ink(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: AppTheme.accentColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: IconButton(
                  onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                  icon: SvgPicture.asset(
                    AppIcons.menu,
                    colorFilter: const ColorFilter.mode(
                      AppTheme.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
