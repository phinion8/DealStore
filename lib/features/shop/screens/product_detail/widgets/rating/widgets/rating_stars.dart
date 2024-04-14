import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({Key? key, required this.value, required this.size}) : super(key: key);
  final double value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: value,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.blue[700],
      ),
      itemCount: 5,
      itemSize: size,
      direction: Axis.horizontal,
    );
  }
}