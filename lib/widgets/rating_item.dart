import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  const RatingItem({required this.index, required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        index <= rating
            ? 'assets/images/Icon_star.png'
            : 'assets/images/Icon_star_grey.png',
        width: 20,
        height: 20);
  }
}