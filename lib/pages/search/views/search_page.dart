import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/search/views/details/details_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/pages/search/views/widgets/business_card.dart';
import 'package:traces/pages/search/views/widgets/business_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _showBusinessCards = false;
  bool _showLogisticsCards = false;

  final List<Map<String, dynamic>> _businesses = [
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
      "iconColor": Color.fromRGBO(105, 105, 108, 1),
      "showRatingText": false,
      "customIcon": CupertinoIcons.star_slash,
    },
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
    },
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
      "ratingColor": Color.fromRGBO(230, 123, 123, 0.75),
      "iconColor": Color.fromRGBO(230, 123, 123, 0.75),
    },
  ];

  final List<Map<String, dynamic>> _logistics = [
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
      "hideCategory": true,
    },
    {
      "logoUrl": "assets/icons/amazon.png",
      "businessName": "Amazon.com, Inc",
      "country": "Sri Lanka",
      "category": "Ecommerce",
      "rating": 4.3,
      "hideCategory": true,
    },
  ];

  List<Map<String, dynamic>> _filteredBusinesses = [];
  List<Map<String, dynamic>> _filteredLogistics = [];

  @override
  void initState() {
    super.initState();
    _filteredBusinesses = _businesses;
    _filteredLogistics = _logistics;
  }

  void _filterSearch(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      _showBusinessCards = _isSearching;
      _showLogisticsCards = _isSearching;

      if (query.isEmpty) {
        _filteredBusinesses = _businesses;
        _filteredLogistics = _logistics;
      } else {
        _filteredBusinesses = _businesses
            .where((business) => business["businessName"]
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

        _filteredLogistics = _logistics
            .where((logistic) => logistic["businessName"]
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showBusinessDetails(Map<String, dynamic> business) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ModalBottomSheet(
        child: DetailsView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                children: [
                  Expanded(child: buildSearchBar()),
                  const SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      FocusScope.of(context).unfocus();
                      setState(() {
                        _isSearching = false;
                        _showBusinessCards = false;
                        _showLogisticsCards = false;
                        _filteredBusinesses = _businesses;
                        _filteredLogistics = _logistics;
                      });
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color.fromRGBO(10, 132, 255, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        height: 1.29,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!_isSearching) ...[
              BusinessListTile(
                svgPath: "assets/icons/building.2.svg",
                title: "Businesses",
                onTap: () => _showCategoryResults("Businesses"),
              ),
              BusinessListTile(
                icon: CupertinoIcons.cube_box,
                title: "Logistics",
                onTap: () => _showCategoryResults("Logistics"),
              ),
              BusinessListTile(
                svgPath: "assets/icons/arrow.trianglehead.counterclockwise.svg",
                title: "Returns",
                onTap: () => _showCategoryResults("Returns"),
                trailingIcon: CupertinoIcons.line_horizontal_3_decrease,
              ),
              BusinessListTile(
                icon: CupertinoIcons.xmark,
                title: "Declined",
                onTap: () => _showCategoryResults("Declined"),
                trailingIcon: CupertinoIcons.line_horizontal_3_decrease,
              ),
            ],
            if (_showBusinessCards || _showLogisticsCards)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _filteredBusinesses.isEmpty &&
                          _filteredLogistics.isEmpty
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 75),
                            child: Opacity(
                              opacity: 0.50,
                              child: Text(
                                'No Results Found',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                          ),
                        )
                      : ListView(
                          children: [
                            if (_filteredBusinesses.isNotEmpty) ...[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Businesses (${_filteredBusinesses.length})",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ..._filteredBusinesses.map((business) {
                                return GestureDetector(
                                  onTap: () => _showBusinessDetails(business),
                                  child: BusinessCard(
                                    logoUrl: business["logoUrl"],
                                    businessName: business["businessName"],
                                    country: business["country"],
                                    category: business["category"],
                                    rating: business["rating"],
                                    showRatingText:
                                        (business["showRatingText"] as bool?) ??
                                            true,
                                    customIcon:
                                        (business["customIcon"] as IconData?) ??
                                            CupertinoIcons.star_fill,
                                    ratingColor:
                                        (business["ratingColor"] as Color?) ??
                                            Color.fromRGBO(209, 219, 88, 0.75),
                                    iconColor:
                                        (business["iconColor"] as Color?) ??
                                            Color.fromRGBO(209, 219, 88, 0.75),
                                  ),
                                );
                              }).toList(),
                            ],
                            if (_filteredLogistics.isNotEmpty) ...[
                              SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Logistics (${_filteredLogistics.length})",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ..._filteredLogistics.map((logistic) {
                                return GestureDetector(
                                  onTap: () => _showBusinessDetails(logistic),
                                  child: BusinessCard(
                                    logoUrl: logistic["logoUrl"],
                                    businessName: logistic["businessName"],
                                    country: logistic["country"],
                                    category: logistic["category"],
                                    rating: logistic["rating"],
                                    showRatingText:
                                        (logistic["showRatingText"] as bool?) ??
                                            true,
                                    customIcon:
                                        (logistic["customIcon"] as IconData?) ??
                                            CupertinoIcons.star_fill,
                                    ratingColor:
                                        (logistic["ratingColor"] as Color?) ??
                                            Color.fromRGBO(209, 219, 88, 0.75),
                                    iconColor:
                                        (logistic["iconColor"] as Color?) ??
                                            Color.fromRGBO(209, 219, 88, 0.75),
                                    hideCategory:
                                        logistic["hideCategory"] ?? false,
                                  ),
                                );
                              }).toList(),
                            ],
                          ],
                        ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.white70,
      onChanged: _filterSearch,
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: const Color.fromRGBO(118, 118, 128, 0.24),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Search for Businesses, Shipments ...",
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          letterSpacing: -0.41,
          color: Color.fromRGBO(235, 235, 245, 0.6),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 12.0, right: 5.0),
          child: Icon(
            CupertinoIcons.search,
            color: Color.fromRGBO(235, 235, 245, 0.6),
            size: 20,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: -0.41,
        color: Colors.white,
      ),
    );
  }

  void _showCategoryResults(String category) {
    setState(() {
      _isSearching = true;
      _showBusinessCards = category == "Businesses";
      _showLogisticsCards = category == "Logistics";

      _filteredBusinesses = _showBusinessCards ? _businesses : [];
      _filteredLogistics = _showLogisticsCards ? _logistics : [];
    });
  }
}
