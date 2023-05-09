import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/space.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  const DetailPage(this.space, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  //final Uri url = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(widget.space.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  fit: BoxFit.cover),
              ListView(
                children: [
                  const SizedBox(height: 328),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          color: whiteColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          //NOTE: TITLE
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: edge),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.space.spaceName,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 22)),
                                    const SizedBox(height: 2),
                                    Text.rich(TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: ' / month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ],
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                    return SizedBox(
                                        child: RatingItem(
                                            index: index,
                                            rating: widget.space.rating));
                                  }).toList(),
                                  /*
                                    Image.asset('assets/images/Icon_star.png',
                                        width: 20, height: 20),
                                    const SizedBox(width: 2),
                                    Image.asset('assets/images/Icon_star.png',
                                        width: 20, height: 20),
                                    const SizedBox(width: 2),
                                    Image.asset('assets/images/Icon_star.png',
                                        width: 20, height: 20),
                                    const SizedBox(width: 2),
                                    Image.asset('assets/images/Icon_star.png',
                                        width: 20, height: 20),
                                    const SizedBox(width: 2),
                                    Image.asset('assets/images/Icon_star.png',
                                        width: 20,
                                        height: 20,
                                        color: const Color(0xff989BA1)),
                                        */
                                )
                              ],
                            ),
                          ),

                          //NOTE: MAIN FACILITIES
                          const SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.only(left: edge),
                            child: Text('Main Facilities',
                                style: regularTextStyle.copyWith(fontSize: 16)),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: edge),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilityItem(
                                    name: 'kitchen',
                                    imageUrl: 'assets/images/icon_kitchen.png',
                                    total: widget.space.numberOfKitchens),
                                FacilityItem(
                                    name: 'bedroom',
                                    imageUrl: 'assets/images/icon_bed.png',
                                    total: widget.space.numberOfBedrooms),
                                FacilityItem(
                                    name: 'Big Lemari',
                                    imageUrl: 'assets/images/icon_library.png',
                                    total: widget.space.numberOfCupboards),
                              ],
                            ),
                          ),

                          //NOTE: PHOTO
                          const SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.only(left: edge),
                            child: Text('Photos',
                                style: regularTextStyle.copyWith(fontSize: 16)),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 88,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: widget.space.photos.map((item) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 24),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(item,
                                            width: 110,
                                            height: 88,
                                            fit: BoxFit.cover),
                                      ),
                                    );
                                  }).toList()
                                /*
                                [
                                  SizedBox(width: edge),
                                  Image.asset('assets/images/photo1.png',
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover),
                                  SizedBox(width: edge),
                                  Image.asset('assets/images/photo2.png',
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover),
                                  SizedBox(width: edge),
                                  Image.asset('assets/images/photo3.png',
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover),
                                  SizedBox(width: edge),
                                ],
                                */
                              )),
                          const SizedBox(height: 30),

                          //NOTE: LOCATION
                          Padding(
                            padding: EdgeInsets.only(left: edge),
                            child: Text('Location',
                                style: regularTextStyle.copyWith(fontSize: 16)),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: edge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${widget.space.address}\n${widget.space.city}',
                                  style: greyTextStyle.copyWith(fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () async {
                                    //final weburl = Uri.parse('gg');
                                    String weblink = widget.space.mapUrl;
                                    if (await canLaunchUrlString(weblink)) {
                                      launchUrlString(weblink,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const ErrorPage()));
                                    }
                                  },
                                  child: Image.asset(
                                      'assets/images/btn_map.png',
                                      width: 40,
                                      height: 40),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          //NOTE: BOOK BUTTON
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: edge),
                              height: 50,
                              width: MediaQuery.of(context).size.width -
                                  (2 * edge),
                              child: ElevatedButton(
                                onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('Konfirmasi',
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 22)),
                                          content: Text(
                                              'Apakah kamu ingin memesan ruangan ini?',
                                              style: regularTextStyle.copyWith(
                                                  fontSize: 16)),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Cancel',
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xffFF5B5B)))),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  final waurl = Uri.parse(
                                                      'https://wa.me/6282176319252');
                                                  String walink =
                                                      'https://wa.me/6282176319252';
                                                  if (await canLaunchUrlString(
                                                      walink)) {
                                                    launchUrlString(walink,
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  } else {
                                                    throw ('cannot launch $waurl');
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: purpleColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8)),
                                                ),
                                                child: Text('Book',
                                                    style:
                                                    whiteTextStyle.copyWith(
                                                        fontSize: 14)))
                                          ],
                                        )),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: purpleColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(17))),
                                child: Text('Book Now',
                                    style:
                                    whiteTextStyle.copyWith(fontSize: 18)),
                              )),
                          const SizedBox(height: 40)
                        ],
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: edge,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/btn_back.png',
                            width: 40)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Image.asset(
                            isClicked
                                ? 'assets/images/btn_wishlist_filled.png'
                                : 'assets/images/btn_wishlist.png',
                            width: 40))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
