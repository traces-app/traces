import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/shipment/views/details/detailed_view.dart';
import 'package:traces/pages/shipment/views/details/overview_view.dart';
import 'package:traces/pages/shipment/views/options/options_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class ShipmentDetailsPage extends StatefulWidget {
  const ShipmentDetailsPage({super.key});

  @override
  State<ShipmentDetailsPage> createState() => _ShipmentDetailsPageState();
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  final PageController _pageController = PageController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(0.0),
        backgroundColor: Colors.black,
        middle: Text(
          "TX 768 431",
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
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            children: const [
              OverviewView(),
              DetailedView(),
            ],
          ),
          GradientBottomOverlay(),
          SwipeIndicator(current: _current),
        ],
      ),
    );
  }
}

class SwipeIndicator extends StatelessWidget {
  final int current;

  const SwipeIndicator({super.key, this.current = 0});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70.0,
      right: 0.0,
      left: 0.0,
      child: Row(
        spacing: 7.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (index) {
          final isActive = index == current;
          return Container(
            width: isActive ? 8.0 : 7.0,
            height: isActive ? 8.0 : 7.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(isActive ? 0.8 : 0.3),
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}

class GradientBottomOverlay extends StatelessWidget {
  const GradientBottomOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [
                0.0,
                0.5,
                1.0,
              ], // Evenly distributed transition points
              colors: [
                Colors.black.withOpacity(1.0), // Strong black at bottom
                Colors.black.withOpacity(0.8), // Midway fade
                Colors.transparent, // Fully transparent at top
              ],
            ),
          ),
        ),
      ),
    );
  }
}
