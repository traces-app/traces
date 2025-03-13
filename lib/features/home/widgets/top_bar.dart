import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/features/home/widgets/filter_option.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_manual_view.dart';
import 'package:traces/pages/search/views/search_page.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/shared/widgets/search_input_field.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              titleSpacing: 0.0,
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: const Text(
                  'Shipments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.337,
                  ),
                ),
              ),
              centerTitle: false,
            ),
            Positioned(
              top: -20,
              right: 10,
              child: ActionButton(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            child: SearchInputField(),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 18.0, left: 9.0, right: 10.0, bottom: 10.0),
            child: const Row(
              spacing: 14.0,
              children: [
                FilterOption(tag: Filters.all, selected: true),
                FilterOption(tag: Filters.delivered, count: 2),
                FilterOption(tag: Filters.inTransit),
                FilterOption(tag: Filters.canceled),
                FilterOption(tag: Filters.outForDelivery),
                FilterOption(tag: Filters.others),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => ModalBottomSheet(
            /* content starts here */
            child: AddShipmentManualView(),
            /* content ends here */
          ),
        );
      },
      child: Container(
        width: 29,
        height: 29,
        decoration: BoxDecoration(
          color: Color(0xff0a84ff),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}
