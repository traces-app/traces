import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 26.0),
          child: Column(
            children: [
              Text("Information About Logistics Or Businesses",
                  style: TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
