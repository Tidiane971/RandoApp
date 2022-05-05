import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rando_app/page.dart';
import 'package:rando_app/styles.dart';
import 'package:rando_app/widgets.dart';

import 'data.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  _FavorisState createState() => _FavorisState();
}

class _FavorisState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          drawer: NavigationDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Column(
                    children: [
                      Icon(LineAwesomeIcons.globe),
                      SizedBox(height: 4),
                      Text(
                        "OtterRando",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            fontFamily: "orkney"),
                      )
                    ],
                  ),
                ),
                Icon(LineAwesomeIcons.search),
              ],
            ),
          ),
          body: Container(
            height: 700,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        "VUES RECEMMENT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: "orkney"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Swiper(
                      loop: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return recentCardes[index];
                      },
                      onIndexChanged: (int index) {
                        setState(
                          () {
                            selected_card_number = index;
                          },
                        );
                      },
                      itemCount: recentCardes.length,
                      viewportFraction: 0.85,
                      scale: 0.9,
                      onTap: (int index) {
                        addToRecent(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page1(
                              card: recentCardes[index],
                              title: recentCardes[index].title,
                              image: recentCardes[index].image,
                              city: recentCardes[index].city,
                              description: recentCardes[index].description,
                            ),
                          ),
                        );
                      },
                    )),
                FootBar(
                  location: "",
                  deviceWidth: 300,
                  index: selected_card_number,
                  text: recentCardes.length.toString(),
                  firsttext: recentCardes.length == 0
                      ? "0"
                      : (selected_card_number + 1).toString(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
