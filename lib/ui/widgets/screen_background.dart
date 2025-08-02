/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_16_07_25/ui/utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.backgroundSvg,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(child: child)
      ],
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_25_07_25/ui/utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.backgroundSvg,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      SafeArea(child: child)
      ],

    );
  }
}
