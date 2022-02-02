import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final String textJml;
  final String text;

  FacilityItem(
      {required this.imageUrl, required this.text, required this.textJml});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: textJml,
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: ' $text',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
