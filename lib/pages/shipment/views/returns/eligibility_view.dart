import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/returns/returns_policy_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class EligibilityView extends StatelessWidget {
  const EligibilityView({super.key});

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
              Text(
                "Report a Return (Shows Eligbility Status)",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(ReturnsPolicyView());
                },
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
