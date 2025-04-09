import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailsView extends StatelessWidget {
  final List<Widget>? actions;
  final bool showCloseButton;

  const DetailsView({
    super.key,
    this.actions,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.78),
                      child: Image.asset(
                        "assets/icons/chanel.png",
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Chanel, Inc.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.45,
                        ),
                      ),
                      SizedBox(width: 6),
                      Opacity(
                        opacity: 0.90,
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.star_fill,
                              color: Color(0xFFD0DA57),
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.3 / 5',
                              style: TextStyle(
                                color: Color(0xFFD0DA57),
                                fontSize: 17.46,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.44,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 405,
                    child: Opacity(
                      opacity: 0.70,
                      child: Text(
                        'Chanel is synonymous with timeless elegance and innovative luxury. '
                        'Founded over a century ago by the legendary Coco Chanel, this iconic '
                        'fashion house redefined style with its sophisticated yet bold designs.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          height: 1.23,
                          letterSpacing: -0.43,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Opacity(
                        opacity: 0.70,
                        child: Text(
                          'United States',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.45,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 3.13,
                        height: 3.13,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF535353),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Opacity(
                        opacity: 0.50,
                        child: Text(
                          'Fashion Retailer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 0,
                    thickness: 0.5,
                    color: Color.fromRGBO(84, 84, 88, 0.65),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 389,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 283,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                width: 283,
                                child: Opacity(
                                  opacity: 0.50,
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                      height: 1.29,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: 283,
                                child: Opacity(
                                  opacity: 0.80,
                                  child: Text(
                                    '3875 Airways, Module H3, Department 4634, Memphis',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                      height: 1.47,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Add navigation to maps or location details
                          },
                          child: Container(
                            width: 36.30,
                            height: 36.30,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF222222),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(121),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.arrow_uturn_right_circle_fill,
                                color: Color(0xFF0069D2),
                                size: 22.99,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                if (showCloseButton)
                  const CloseButton(
                    color: Colors.white,
                  ),
                if (actions != null) ...actions!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
