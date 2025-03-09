import 'package:flutter/material.dart';
import 'package:traces/core/models/group.dart';
import 'package:traces/core/utils/app_icons.dart';
import 'package:flutter_svg/svg.dart';

class ShipmentGroup extends StatelessWidget {
  final Group group;
  final List<Widget> children;

  const ShipmentGroup({
    super.key,
    required this.group,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: _buildGroupLabel(group),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  height: 25.0,
                  AppIcons.collapse,
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(255, 255, 255, 0.5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Divider(
            thickness: 1,
            color: Color.fromRGBO(84, 84, 88, 0.4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 12.0, top: 0.5),
          child: Column(
            spacing: 10.0,
            children: children,
          ),
        ),
      ],
    );
  }
}

Widget _buildGroupLabel(Group? group) {
  if (group == null) return SizedBox.shrink();

  ColorFilter colorFilter = ColorFilter.mode(
    group.color,
    BlendMode.srcIn,
  );

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
    decoration: BoxDecoration(
      color: group.background,
      borderRadius: BorderRadius.circular(11),
    ),
    child: Row(
      spacing: 10.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          group.label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.44,
            color: group.color,
          ),
        ),
        if (group.iconPath != null)
          SvgPicture.asset(
            group.iconPath!,
            height: 15.0,
            colorFilter: colorFilter,
          ),
      ],
    ),
  );
}
