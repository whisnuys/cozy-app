import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/page/error_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/csrating_bar.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    launcherUrl(String url) async {
      if (!await launch(url))
        // throw url;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
// NOTE: Thumbnail
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),

// NOTE: ==== Content ====
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
// NOTE: Title
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style: blackTextStyle.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: ' / month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CsRatingBar(
                                rating: widget.space.rating.toDouble(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
// NOTE: Main Facilities
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Main Facilities',
                                style: regularTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FacilityItem(
                                    imageUrl: 'assets/icon_kitchen.png',
                                    textJml: '${widget.space.numberOfKitchen}',
                                    text: 'Kitchen',
                                  ),
                                  FacilityItem(
                                    imageUrl: 'assets/icon_bedroom.png',
                                    textJml: '${widget.space.numberOfBedrooms}',
                                    text: 'Bedroom',
                                  ),
                                  FacilityItem(
                                    imageUrl: 'assets/icon_cupboard.png',
                                    textJml:
                                        '${widget.space.numberOfCupboards}',
                                    text: 'Big Lemari',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
// NOTE: Photos
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Photos',
                                style: regularTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 88,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: widget.space.photos.map((item) {
                                    return Container(
                                      margin: EdgeInsets.only(right: edge),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          item,
                                          width: 118,
                                          height: 88,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
// NOTE: Location
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: regularTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${widget.space.address}\n${widget.space.city}',
                                    style: greyTextStyle.copyWith(fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // launcherUrl(
                                      //     'https://goo.gl/maps/7VCjSLpPrw24eKmb8');
                                      launcherUrl(widget.space.mapUrl);
                                    },
                                    child: Image.asset(
                                      'assets/btn_map.png',
                                      width: 40,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
// NOTE: Button Book Now
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('Confirmation'),
                                        content: const Text(
                                            'Do you want to contact the owner?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'No'),
                                            child: const Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              launcherUrl(
                                                'tel:${widget.space.phone}',
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Yes'),
                                          ),
                                        ],
                                      ));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: purpleColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/btn_wishlist_active.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
