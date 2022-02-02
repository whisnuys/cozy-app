import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CsRatingBar extends StatelessWidget {
  final double rating;

  CsRatingBar({required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      itemSize: 20,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star_rounded,
        color: Color(0xffFF9376),
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
