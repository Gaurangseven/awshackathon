import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({
    required this.colour,
    required this.childcard,
    this.onCategory,
  });
  final Color colour;
  final Widget childcard;
  final VoidCallback? onCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCategory,
      child: Container(
        child: childcard,
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
