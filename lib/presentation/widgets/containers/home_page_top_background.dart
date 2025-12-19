import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/gen/assets.gen.dart';

class HomePageTopBackground extends StatelessWidget {
  const HomePageTopBackground({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .3,
      width: size.width,
      decoration: BoxDecoration(
        color: AppSolidColors.primary,
        image: DecorationImage(
          image: AssetImage(Assets.image.homeAppbarBg.path),
          fit: BoxFit.cover,
          opacity: .5,
        ),
      ),
    );
  }
}