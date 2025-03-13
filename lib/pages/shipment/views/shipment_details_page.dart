import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/map/views/maps_page.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class ShipmentDetailsPage extends StatefulWidget {
  const ShipmentDetailsPage({super.key});

  @override
  State<ShipmentDetailsPage> createState() => _ShipmentDetailsPageState();
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
                child: InitialContent(),
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
      ),
    );
  }
}

class InitialContent extends StatelessWidget {
  const InitialContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                  modal?.navigateTo(SecondContent());
                },
                child: Text("Edit Shipping Address"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SecondContent extends StatelessWidget {
  const SecondContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Column(
            children: [
              Text("Edit Shipping Information",
                  style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(InitialContent());
                },
                child: Text("Edit Address"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
