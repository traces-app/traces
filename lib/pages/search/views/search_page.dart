import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/search/views/details/details_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(0.0),
        backgroundColor: Colors.transparent,
        leading: Navigator.of(context).canPop()
            ? CupertinoNavigationBarBackButton(
                color: Color(0xFF0A84FF),
                previousPageTitle: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Column(
                  children: [
                    Text("Search for Business, Logistics, Shipments",
                        style: TextStyle(fontSize: 18.0)),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ModalBottomSheet(
                            /* content starts here */
                            child: DetailsView(),
                            /* content ends here */
                          ),
                        );
                      },
                      child: Text("Open Sample Detailed Popup"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
