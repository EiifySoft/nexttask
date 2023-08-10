import 'package:flutter/material.dart';
import 'package:task/common/colors/index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: buildSplashLogo(size),
      ),
    );
  }
}

Container buildSplashLogo(Size size) {
  return Container(
    height: size.width / 3,
    width: size.width / 3,
    decoration: BoxDecoration(
      color: LightModeColor.blueColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: LightModeColor.blueColor.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 10,
        ),
      ],
    ),
    child: Icon(
      Icons.check,
      color: LightModeColor.backgroundColor,
      size: size.width / 8,
    ),
  );
}
