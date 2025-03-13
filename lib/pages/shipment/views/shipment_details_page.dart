import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/shipment/views/options/options_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/shared/widgets/order_confirmation_view.dart';

class ShipmentDetailsPage extends StatefulWidget {
  const ShipmentDetailsPage({super.key});

  @override
  State<ShipmentDetailsPage> createState() => _ShipmentDetailsPageState();
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(0.0),
        backgroundColor: Colors.black,
        middle: Text(
          "Shipment Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        leading: Navigator.of(context).canPop()
            ? CupertinoNavigationBarBackButton(
                color: Color(0xFF0A84FF),
                previousPageTitle: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ModalBottomSheet(
                /* content starts here */
                child: OptionsView(),
                /* content ends here */
              ),
            );
          },
          icon: Icon(
            CupertinoIcons.ellipsis_circle,
            size: 24.0,
            color: Color(0xFF0A84FF),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ModalBottomSheet(
                  showCloseButton: true,
                  child: OrderConfirmationView(),
                ),
              );
            },
            child: Text("Receive Order Confirmation (Test)"),
          ),
        ),
      ),
    );
  }
}
