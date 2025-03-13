import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(0.0),
        backgroundColor: Colors.black,
        middle: Text(
          "Map View",
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
          onPressed: () {},
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
