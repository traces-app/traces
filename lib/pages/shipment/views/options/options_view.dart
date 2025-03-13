import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/map/views/map_page.dart';
import 'package:traces/pages/shipment/views/edit/view_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/returns/eligibility_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final rootContext = Navigator.of(context, rootNavigator: true)
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
                child: Text("Map View"),
              ),
              SizedBox(height: 5.0), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(ViewShippingInformationView());
                },
                child: Text("Edit Shipping Address"),
              ),
              SizedBox(height: 5.0), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(EligibilityView());
                },
                child: Text("Report a Return"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
