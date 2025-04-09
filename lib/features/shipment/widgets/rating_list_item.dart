import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RatingListItem extends StatelessWidget {
  final String name;
  final String country;
  final String? category;
  final double rating;
  final String src;

  const RatingListItem({
    super.key,
    required this.name,
    required this.country,
    this.category,
    required this.rating,
    this.src = "#",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 15.0,
          children: [
            ClipOval(
              child: Image.network(
                src,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                Row(
                  spacing: 12.0,
                  children: [
                    Text(
                      country,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    if (category != null) ...[
                      Container(
                        height: 3.5,
                        width: 3.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        category!,
                        style: TextStyle(
                          fontSize: 15.5,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
        Rating(rating: rating),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  final double rating;

  const Rating({
    super.key,
    required this.rating,
  });

  Color _getRatingThemeColor() {
    if (rating <= 2.5) {
      return const Color.fromARGB(255, 240, 110, 101).withOpacity(0.6);
    } else if (rating <= 4.0) {
      return Colors.white.withOpacity(0.6);
    } else {
      return Color.fromRGBO(209, 219, 88, 0.75);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color ratingColorGroup = _getRatingThemeColor();

    return Row(
      spacing: 8.5,
      children: [
        Icon(
          CupertinoIcons.star_fill,
          size: 16.0,
          color: ratingColorGroup,
        ),
        Text(
          "$rating / 5",
          style: TextStyle(
            fontSize: 16.5,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w500,
            color: ratingColorGroup,
          ),
        ),
      ],
    );
  }
}
