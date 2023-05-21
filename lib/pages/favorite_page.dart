import 'package:flutter/material.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: edge,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              //NOTE: TITLE/HEADER
              Text('Pilihan Favoritmu',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  )),

              const SizedBox(height: 16),

              FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data as List<Space>;
                      // Filter hanya pada isFavorite yang bernilai true
                      var filteredData = data
                          .where((item) => item.isFavorite == true)
                          .toList();

                      int index = 0;
                      return Column(
                        children: filteredData.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
