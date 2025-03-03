import 'package:flutter/material.dart';
import 'package:traces/core/utils/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tickmark extends StatelessWidget {
  const Tickmark({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppIcons.tickmark);
  }
}
