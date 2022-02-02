import 'package:bwa_cozy/models/tips.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl,
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                'Updated ${tips.updatedAt}',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right),
            color: greyColor,
          ),
        ],
      ),
    );
  }
}
