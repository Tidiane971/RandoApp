import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rando_app/page.dart';
import 'package:rando_app/styles.dart';
import 'package:rando_app/widgets.dart';

import 'data.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _FavorisState createState() => _FavorisState();
}

class _FavorisState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Column(
                    children: [
                      Icon(
                        LineAwesomeIcons.globe,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "OtterRando",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            fontFamily: "orkney",
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                Icon(
                  LineAwesomeIcons.search,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Text("Bonjour ceci sont les crédits "),
          ),
        ),
      ],
    );
  }
}
