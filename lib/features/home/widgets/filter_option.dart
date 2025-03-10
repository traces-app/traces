import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/core/utils/app_icons.dart';

enum Filters {
  all("All"),
  inTransit("In Transit"),
  outForDelivery("Out for Delivery"),
  delivered("Delivered"),
  canceled("Canceled"),
  others("Others");

  final String label; // Custom label for display

  const Filters(this.label);
}

class FilterOption extends StatelessWidget {
  final Filters tag;
  final int count;
  final bool selected;

  const FilterOption({
    super.key,
    required this.tag,
    this.count = 0,
    this.selected = false,
  });

  Widget? _getFilterIcon() {
    Color color = selected
        ? Color.fromRGBO(162, 205, 249, 0.7)
        : count > 0
            ? Color.fromRGBO(235, 235, 245, 0.5)
            : Color.fromRGBO(132, 132, 141, 0.418);

    ColorFilter colorFilter = ColorFilter.mode(
      color,
      BlendMode.srcIn,
    );

    switch (tag) {
      case Filters.all:
        return null;
      case Filters.inTransit:
        return SvgPicture.asset(AppIcons.path, colorFilter: colorFilter);
      case Filters.outForDelivery:
        return SvgPicture.asset(AppIcons.arrowForward,
            colorFilter: colorFilter, height: 13.0);
      case Filters.delivered:
        return SvgPicture.asset(AppIcons.tickmark, colorFilter: colorFilter);
      case Filters.canceled:
        return SvgPicture.asset(AppIcons.close, colorFilter: colorFilter);
      case Filters.others:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        decoration: BoxDecoration(
          color: selected
              ? Color.fromRGBO(0, 69, 139, 0.58)
              : count > 0
                  ? Color.fromRGBO(118, 118, 128, 0.192)
                  : Color.fromRGBO(118, 118, 128, 0.144),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          spacing: 8,
          children: [
            if (_getFilterIcon() != null) _getFilterIcon()!,
            Text(
              tag.label,
              style: TextStyle(
                color: selected
                    ? Color.fromRGBO(162, 205, 249, 0.7)
                    : count > 0
                        ? Color.fromRGBO(235, 235, 245, 0.5)
                        : Color.fromRGBO(132, 132, 141, 0.418),
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.2,
              ),
            ),
            if (count > 0 || selected)
              Text(
                count.toString(),
                style: TextStyle(
                  color: selected
                      ? Color.fromRGBO(162, 205, 249, 0.7)
                      : count > 0
                          ? Color.fromRGBO(235, 235, 245, 0.3)
                          : Color.fromRGBO(235, 235, 245, 0.384),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
