import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

import '../models/space.dart';
import '../pages/detail_page.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard(this.space, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Row(
        children: [
          SizedBox(
              width: 130,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.network(
                      space.imageUrl,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        width: 70,
                        height: 30,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Icon_star.png',
                                  width: 18, height: 18),
                              Text('${space.rating}/5',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 13,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(space.spaceName,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  )),
              const SizedBox(height: 2),
              Text.rich(TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: ' / month',
                        style: greyTextStyle.copyWith(fontSize: 16))
                  ])),
              const SizedBox(height: 16),
              Text(
                '${space.city}, ${space.country}',
                style: greyTextStyle.copyWith(fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}