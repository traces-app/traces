import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/core/utils/app_icons.dart';

class ModalBottomSheet extends StatefulWidget {
  final Widget child;

  final Color background;
  final bool showCloseButton;
  final List<Widget>? actions;

  const ModalBottomSheet({
    super.key,
    required this.child,
    this.background = const Color(0xFF121212),
    this.showCloseButton = false,
    this.actions,
  });

  @override
  State<ModalBottomSheet> createState() => ModalBottomSheetState();
}

class ModalBottomSheetState extends State<ModalBottomSheet> {
  Widget? _current;

  void navigateTo(Widget view) {
    setState(() {
      _current = view;
    });
  }

  @override
  void initState() {
    super.initState();
    _current = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF121212),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // content
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            child: Container(
              margin: EdgeInsets.only(bottom: 36.0),
              width: double.infinity,
              // color: Colors.red, /* (toggle the comment to view the content area) */
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _current,
              ),
            ),
          ),

          // handle
          Positioned(
            top: 6.0,
            left: 0,
            right: 0,
            child: Handle(),
          ),

          // actions
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  if (widget.showCloseButton) CloseButton(),
                  if (widget.actions != null) ...widget.actions!,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Handle extends StatelessWidget {
  const Handle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(60, 60, 67, 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      splashColor: null,
      highlightColor: null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          AppIcons.close,
          height: 13.5,
          width: 13.5,
          colorFilter: ColorFilter.mode(
            Color(0xFF707079),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
