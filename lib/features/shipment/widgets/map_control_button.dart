import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapControlButtons extends StatelessWidget {
  final VoidCallback onPinPress;
  final VoidCallback onLocatePress;

  const MapControlButtons({
    Key? key,
    required this.onPinPress,
    required this.onLocatePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20, // Adjust position as needed
      right: 10, // Adjust position as needed
      child: Column(
        children: [
          /// **Pin Button**
          InkWell(
            onTap: onPinPress,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.68), // Background color
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.map_pin,
                  size: 28, // Adjust size
                  color: Color.fromRGBO(133, 133, 133, 0.63), // Adjust color
                ),
              ),
            ),
          ),

          /// **Divider Line**
          Container(
            width: 50,
            height: 1,
            color: Colors.grey.withOpacity(0.4), // Divider line
          ),

          /// **Locate Button**
          InkWell(
            onTap: onLocatePress,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black, // Background color
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.location_fill,
                  size: 24, // Adjust size
                  color: Color.fromRGBO(216, 216, 216, 0.63), // Adjust color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
