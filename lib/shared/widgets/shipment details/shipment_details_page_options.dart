import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/map/views/map_page.dart';

void showShipmentDetailsPageOptions(
    {required BuildContext context, bool inTransit = true}) {
  Color _dividerColor = Color(0xFF3B3B3D);
  double _dividorHeight = 0.5;
  double _dividorThickness = 0.5;

  showModalBottomSheet(
    backgroundColor: Color(0xFF121212),
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 6),
              width: 36,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xFF98989C).withOpacity(0.5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 19,
              left: 21,
              right: 21,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                option(
                    optionName: "Map View",
                    icon: Icon(CupertinoIcons.map_pin),
                    firstItem: true,
                    navigateTo: () =>
                        navigate(context: context, widget: MapPage())),
                Divider(
                    color: _dividerColor,
                    height: _dividorHeight,
                    thickness: _dividorThickness),
                option(
                  optionName: "Edit Shipping Address",
                  icon: Icon(CupertinoIcons.refresh),
                  notInTransit: !inTransit,
                ),
                Divider(
                    color: _dividerColor,
                    height: _dividorHeight,
                    thickness: _dividorThickness),
                option(
                    optionName: "Report a Problem",
                    icon: Icon(CupertinoIcons.exclamationmark_bubble)),
                Divider(
                    color: _dividerColor,
                    height: _dividorHeight,
                    thickness: _dividorThickness),
                option(
                    optionName: "Contact Customer Service",
                    icon: Icon(CupertinoIcons.phone)),
                Divider(
                    color: _dividerColor,
                    height: _dividorHeight,
                    thickness: _dividorThickness),
                option(
                  optionName: "Request Return",
                  icon: Icon(CupertinoIcons.refresh),
                  notInTransit: !inTransit,
                  lastItem: true,
                ),
                option(
                    optionName: "Cancel Order",
                    icon: Icon(CupertinoIcons.clear_circled,
                        color: CupertinoColors.systemRed),
                    lastItem: true,
                    notInTransit: !inTransit),
                SizedBox(height: 28),
                option(
                    optionName: "Delete Shipment",
                    icon: Icon(CupertinoIcons.delete,
                        color: CupertinoColors.systemRed),
                    firstItem: true),
                SizedBox(height: 39),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget option({
  required String optionName,
  required Icon icon,
  bool firstItem = false,
  bool lastItem = false,
  bool notInTransit = false,
  VoidCallback? navigateTo,
}) {
  double borderRadiusTop = firstItem ? 12 : 0;
  double borderRadiusBottom = lastItem ? 12 : 0;
  Color fontColor =
      (optionName.contains("Cancel") || optionName.contains("Delete"))
          ? Color(0xFFFF453A)
          : Colors.white;

  return ((notInTransit &&
              (optionName.contains("Edit") ||
                  (optionName.contains("Cancel")))) ||
          (notInTransit == false && optionName.contains("Return")))
      ? SizedBox.shrink()
      : InkWell(
          onTap: navigateTo,
          child: Container(
            height: 50, // Ensuring consistent height
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(borderRadiusTop),
                bottom: Radius.circular(borderRadiusBottom),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    optionName,
                    style: TextStyle(color: fontColor, fontSize: 18),
                  ),
                  icon
                ],
              ),
            ),
          ),
        );
}

void navigate({required BuildContext context, required Widget widget}) {
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
