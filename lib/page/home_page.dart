import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import '../models/city.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
// NOTE: TITLE / HEADER
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Mencari kosan yang cozy',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
// NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      City(
                        id: 1,
                        imageUrl: 'assets/city1.png',
                        text: 'Jakarta',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                          id: 2,
                          imageUrl: 'assets/city2.png',
                          text: 'Bandung',
                          isPopular: true),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 3,
                        imageUrl: 'assets/city3.png',
                        text: 'Surabaya',
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 4,
                        imageUrl: 'assets/city4.png',
                        text: 'Palembang',
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 5,
                        imageUrl: 'assets/city5.png',
                        text: 'Aceh',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 6,
                        imageUrl: 'assets/city6.png',
                        text: 'Bogor',
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
//  NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: spaceProvider.getRecommendedSpace(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<Space> data = snapshot.data;
                  var index = 0;
                  return Column(
                    children: data.map((item) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                        child: SpaceCard(item),
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),

            SizedBox(
              height: 30,
            ),
// NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                TipsCard(
                  Tips(
                    id: 1,
                    title: 'City Guidelines',
                    imageUrl: 'assets/tips1.png',
                    updatedAt: '20 Apr',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TipsCard(
                  Tips(
                    id: 2,
                    title: 'Jakarta Fairship',
                    imageUrl: 'assets/tips2.png',
                    updatedAt: '11 Dec',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70 + edge,
            ),
          ],
        ),
      ),
// NOTE: Bottom Navbar
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
