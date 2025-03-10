import 'package:flutter/material.dart';

class Markdown extends StatelessWidget {
  final String description;

  const Markdown({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final RegExp exp = RegExp(r'\*\*(.*?)\*\*'); // Match **highlight**

    final List<InlineSpan> spans = [];
    int currentIndex = 0;

    for (final Match match in exp.allMatches(description)) {
      if (match.start > currentIndex) {
        spans.add(TextSpan(
          text: description.substring(currentIndex, match.start),
          style: TextStyle(
            color: Color.fromRGBO(237, 231, 170, 0.5),
            fontSize: 16.5,
            fontWeight: FontWeight.w500,
          ),
        ));
      }

      final String highlightedText = match.group(1)!; // Text inside **
      spans.add(TextSpan(
        text: highlightedText,
        style: TextStyle(
          color: Color.fromRGBO(237, 231, 170, 0.75),
          fontSize: 16.5,
        ),
      ));

      currentIndex = match.end;
    }

    if (currentIndex < description.length) {
      spans.add(TextSpan(
        text: description.substring(currentIndex),
        style: TextStyle(
          color: Color.fromRGBO(237, 231, 170, 0.5), // Normal color
          fontSize: 16.5,
          fontWeight: FontWeight.w500,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
