import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/core/utils/app_icons.dart';

class NoContent extends StatelessWidget {
  const NoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 70), // Spacing
                SvgPicture.asset(AppIcons.window),
                SizedBox(height: 19), // Spacing
                Text(
                  "No Shipments Found",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: -0.31,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                ),
                SizedBox(height: 4), // Spacing
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Tap on ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: -0.31,
                      height: 1.4,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 19,
                            height: 19,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(10, 132, 255, 0.8),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 19,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text:
                            ' in the top right corner to link a new shipment.',
                      ),
                    ],
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
