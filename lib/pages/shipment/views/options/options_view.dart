import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:traces/pages/map/views/map_page.dart';
import 'package:traces/pages/shipment/views/edit/view_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/returns/eligibility_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 30.0,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Column(
              spacing: 1.0,
              children: [
                CupertinoContextMenuAction(
                  trailingIcon: CupertinoIcons.map_pin,
                  onPressed: () async {
                    final rootContext =
                        Navigator.of(context, rootNavigator: true)
                            .context; // capture safe context

                    Navigator.of(context, rootNavigator: true).pop();
                    await Future.delayed(
                        Duration(milliseconds: 500)); // Add delay
                    if (rootContext.mounted) {
                      Navigator.of(rootContext).push(
                        CupertinoPageRoute(builder: (context) => MapPage()),
                      );
                    }
                  },
                  child: Text("Map View", style: TextStyle(fontSize: 17.5)),
                ),
                CupertinoContextMenuAction(
                  trailingIcon: CupertinoIcons.keyboard,
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(ViewShippingInformationView());
                  },
                  child: Text("Edit Shipping Address",
                      style: TextStyle(fontSize: 17.5)),
                ),
                CupertinoContextMenuAction(
                  trailingIcon: CupertinoIcons.arrow_counterclockwise,
                  onPressed: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(EligibilityView());
                  },
                  child: Text("Request a Return",
                      style: TextStyle(fontSize: 17.5)),
                ),
                CupertinoContextMenuAction(
                  trailingIcon: CupertinoIcons.map_pin,
                  onPressed: () {},
                  child: Text("Report a Problem",
                      style: TextStyle(fontSize: 17.5)),
                ),
                CupertinoContextMenuAction(
                  trailingIcon: CupertinoIcons.chat_bubble,
                  onPressed: () {},
                  child: Text(
                    "Contact Customer Service",
                    style: TextStyle(fontSize: 17.5),
                  ),
                ),
                CupertinoContextMenuAction(
                  isDestructiveAction: true,
                  trailingIcon: CupertinoIcons.xmark_circle,
                  onPressed: () {},
                  child: Text(
                    "Cancel Order",
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Column(
              children: [
                CupertinoContextMenuAction(
                  isDestructiveAction: true,
                  trailingIcon: CupertinoIcons.delete,
                  onPressed: () {},
                  child: Text(
                    "Delete Shipment",
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
