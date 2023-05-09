import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

import '../models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard(this.tips, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          child: Image.asset(tips.imageUrl),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tips.title, style: blackTextStyle.copyWith(fontSize: 18)),
            const SizedBox(height: 4),
            Text(
              'Updated ${tips.updateAt}',
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.chevron_right, color: greyColor))
      ],
    );
  }
}