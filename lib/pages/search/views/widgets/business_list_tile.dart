import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessListTile extends StatelessWidget {
  final IconData? icon;
  final String? svgPath;
  final String title;
  final VoidCallback? onTap;
  final IconData? trailingIcon;
  final Color iconColor;
  final Color trailingIconColor;
  final double iconSize;
  final double trailingIconSize;

  const BusinessListTile({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
    this.onTap,
    this.trailingIcon = CupertinoIcons.chevron_forward,
    this.iconColor = const Color.fromRGBO(10, 132, 255, 1),
    this.trailingIconColor = const Color.fromRGBO(105, 105, 108, 1),
    this.iconSize = 22,
    this.trailingIconSize = 20,
  }) : assert(icon != null || svgPath != null,
            "Either an icon or svgPath must be provided.");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 18, top: 2, bottom: 2),
            child: Row(
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  alignment: Alignment.center,
                  child: svgPath != null
                      ? SvgPicture.asset(
                          svgPath!,
                          width: iconSize,
                          height: iconSize,
                          colorFilter:
                              ColorFilter.mode(iconColor, BlendMode.srcIn),
                        )
                      : Icon(icon, color: iconColor, size: iconSize),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (trailingIcon != null)
                  Icon(trailingIcon,
                      color: trailingIconColor, size: trailingIconSize),
              ],
            ),
          ),
        ),
        Divider(
          color: const Color.fromRGBO(84, 84, 88, 0.65),
          thickness: 0.5,
          indent: 24,
        ),
      ],
    );
  }
}
