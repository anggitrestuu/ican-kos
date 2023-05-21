import 'package:flutter/material.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:provider/provider.dart';
import '../models/city.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              Text('Dapatkan infonya dan langsung sewa di IcanKos. ',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  )),
              const SizedBox(height: 2),
              Text(
                'Ditemukan 1868 kos-kosan di sekitar UGM',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              //NOTE: POPULAR CITIES
              Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CityCard(
                        City(
                          id: 1,
                          name: 'Sleman',
                          imageUrl: 'assets/images/city1.png',
                        ),
                      ),
                      const SizedBox(width: 20),
                      CityCard(
                        City(
                            id: 2,
                            name: 'Yogyakarta',
                            imageUrl: 'assets/images/city2.png',
                            isPopular: true),
                      ),
                      const SizedBox(width: 20),
                      CityCard(City(
                        id: 3,
                        name: 'Bantul',
                        imageUrl: 'assets/images/city3.png',
                      )),
                      const SizedBox(width: 20),
                      CityCard(City(
                        id: 4,
                        name: 'Kulon Progo',
                        imageUrl: 'assets/images/city4.png',
                      )),
                      const SizedBox(width: 20),
                      CityCard(
                        City(
                            id: 5,
                            name: 'Gunung Kidul',
                            imageUrl: 'assets/images/city5.png',
                            isPopular: true),
                      ),
                      const SizedBox(width: 20),
                      CityCard(City(
                        id: 6,
                        name: 'Magelang',
                        imageUrl: 'assets/images/city6.png',
                      )),
                      const SizedBox(width: 20),
                    ],
                  )),
              const SizedBox(height: 30),

              Text(
                'Kosan Popular',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 16),

              FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data as List<Space>;
                      int index = 0;
                      return Column(
                        children: data.map((item) {
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

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
