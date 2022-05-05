import 'package:flutter/material.dart';
import 'package:rando_app/map_launcher.dart';
import 'package:rando_app/styles.dart';
import 'package:rando_app/widgets.dart';
import 'data.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class Page1 extends StatefulWidget {
  Page1({
    required this.image,
    required this.title,
    required this.description,
    required this.city,
    required this.card,
  });
  String image;
  String title;
  String description;
  String city;
  Cardo card;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(widget.image),
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.card.isLiked = !widget.card.isLiked;

                      if (widget.card.isLiked) {
                        if (favCardes.contains(widget.card) == false) {
                          print("liked");
                          favCardes.add(widget.card);
                        }
                      } else {
                        print("deliked");
                        favCardes.remove(widget.card);
                      }
                    });
                  },
                  child: Icon(
                    LineAwesomeIcons.heart,
                    color: widget.card.isLiked ? Colors.red : Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(height: 30),
                Text(
                  "32Km",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(height: 30),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          MapUtils.openMap(widget.title, widget.city);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 11, 189, 92),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            LineAwesomeIcons.map_pin,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Plus D'informations"),
                            Icon(LineAwesomeIcons.long_arrow_right)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
