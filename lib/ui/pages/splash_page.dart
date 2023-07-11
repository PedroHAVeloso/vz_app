import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset(
                  'assets/background/top.svg',
                  width: MediaQuery.sizeOf(context).width * 0.6,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                heightFactor: 0.6,
                child: SvgPicture.asset(
                  'assets/logos/logo.svg',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/background/bottom.svg',
                  width: MediaQuery.sizeOf(context).width * 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
