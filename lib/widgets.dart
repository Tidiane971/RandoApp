import 'package:flutter/material.dart';
import 'package:rando_app/Favoris.dart';
import 'package:rando_app/recent.dart';
import 'package:rando_app/settings.dart';
import 'dart:ui';

import 'home.dart';
import 'styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class BackgroundImage extends StatelessWidget {
  //L'IMAGE DE FOND
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          fit: BoxFit.cover,
          image: AssetImage("images/bg.jpg"),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
    );
  }
}

class Categories_List extends StatefulWidget {
  Categories_List({required this.changeCate});
  // LA LIST VIEW DES CATEGORIES
  Function changeCate;

  @override
  _Categories_ListState createState() => _Categories_ListState();
}

class _Categories_ListState extends State<Categories_List> {
  void onPressed(String name) {
    setState(
      () {
        selected_categories.forEach(
          (key, value) {
            selected_categories[key] = false;
          },
        );
        selected_categories[name] = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 14),
                    child: Icon(
                      LineAwesomeIcons.asterisk,
                      size: 30,
                      color: selected_categories["Tout"]
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      child: CategorieButton(
                        name: "Tout",
                        colour: selected_categories["Tout"]
                            ? Colors.white
                            : Colors.white54,
                      ),
                      onPressed: () {
                        onPressed("Tout");
                        widget.changeCate();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 14),
                    child: Icon(
                      LineAwesomeIcons.tint,
                      size: 30,
                      color: selected_categories["Rivière"]
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      child: CategorieButton(
                        name: "Rivière",
                        colour: selected_categories["Rivière"]
                            ? Colors.white
                            : Colors.white54,
                      ),
                      onPressed: () {
                        onPressed("Rivière");
                        widget.changeCate();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 14),
                    child: Icon(
                      LineAwesomeIcons.sun_o,
                      size: 30,
                      color: selected_categories["Plage"]
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      child: CategorieButton(
                        name: "Plage",
                        colour: selected_categories["Plage"]
                            ? Colors.white
                            : Colors.white54,
                      ),
                      onPressed: () {
                        onPressed("Plage");
                        widget.changeCate();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 14),
                    child: Icon(
                      LineAwesomeIcons.tree,
                      size: 30,
                      color: selected_categories["Forêt"]
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      child: CategorieButton(
                        name: "Forêt",
                        colour: selected_categories["Forêt"]
                            ? Colors.white
                            : Colors.white54,
                      ),
                      onPressed: () {
                        onPressed("Forêt");
                        widget.changeCate();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 14),
                    child: Icon(
                      LineAwesomeIcons.camera,
                      size: 30,
                      color: selected_categories["Montagne"]
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      child: CategorieButton(
                        name: "Point De Vue",
                        colour: selected_categories["Montagne"]
                            ? Colors.white
                            : Colors.white54,
                      ),
                      onPressed: () {
                        onPressed("Montagne");
                        widget.changeCate();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class CategorieButton extends StatefulWidget {
  CategorieButton({required this.name, required this.colour});

  String name;
  Color colour;

  @override
  _CategorieButtonState createState() => _CategorieButtonState();
}

class _CategorieButtonState extends State<CategorieButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 0, left: 18),
      child: Text(
        widget.name,
        style: TextStyle(
          fontSize: 17,
          color: widget.colour,
          fontFamily: "orkney",
        ),
      ),
    );
  }
}

class Cardo extends StatefulWidget {
  Cardo({
    required this.image,
    required this.title,
    required this.description,
    required this.city,
    required this.isLiked,
  });

  final String image;
  final String title;
  final String description;
  final String city;
  bool isLiked;

  @override
  _CardoState createState() => _CardoState();
}

class _CardoState extends State<Cardo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.image),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Icon(
                LineAwesomeIcons.heart,
                size: 30,
                color: widget.isLiked ? Colors.red : Colors.white,
              ),
            ),
            Flexible(
                child: SizedBox(
              height: 300,
            )),
            Flexible(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white, fontSize: 42, fontFamily: "orkney"),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                child: SingleChildScrollView(
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontFamily: "orkney"),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Text(
                    "Discover Place",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "orkney"),
                  ),
                  Icon(
                    LineAwesomeIcons.long_arrow_right,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FootBar extends StatefulWidget {
  FootBar({
    Key? key,
    required this.deviceWidth,
    required this.index,
    required this.text,
    required this.firsttext,
    required this.location,
  }) : super(key: key);

  final double deviceWidth;
  final int index;
  final String text;
  final String firsttext;
  final String location;

  @override
  _FootBarState createState() => _FootBarState();
}

class _FootBarState extends State<FootBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.firsttext,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "orkney"),
                      ),
                      TextSpan(
                        text: "/",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 11,
                            fontFamily: "orkney"),
                      ),
                      TextSpan(
                        text: widget.text,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontFamily: "orkney"),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "orkney",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.long_arrow_left,
                      color: Colors.white70,
                    ),
                    Icon(
                      LineAwesomeIcons.long_arrow_right,
                      color: Colors.white70,
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: widget.deviceWidth,
              height: 1,
              color: Colors.white.withOpacity(0.8),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 280,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 31, 33),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color.fromARGB(255, 32, 214, 107),
                        ),
                        child: Icon(
                          LineAwesomeIcons.buysellads,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "TurtleRando",
                        style: categories,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 36,
              child: Container(
                color: Color.fromARGB(255, 22, 22, 24),
                child: ListView(
                  children: [
                    Menuoption(
                      icon: LineAwesomeIcons.home,
                      title: "Accueil",
                      colour: accueil_s
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                      hover: accueil_s ? Colors.black : Colors.transparent,
                      weight: accueil_s ? FontWeight.bold : FontWeight.normal,
                      onPressed: () {
                        setState(
                          () {
                            accueil_s = !accueil_s;
                            favoris_s = false;
                            recent_s = false;
                            para_s = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Menuoption(
                      icon: LineAwesomeIcons.heart,
                      title: "Favoris",
                      colour: favoris_s
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                      hover: favoris_s ? Colors.black : Colors.transparent,
                      weight: favoris_s ? FontWeight.bold : FontWeight.normal,
                      onPressed: () {
                        setState(
                          () {
                            selected_card_number = 0;
                            favoris_s = !favoris_s;
                            recent_s = false;
                            para_s = false;
                            accueil_s = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Favoris(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Menuoption(
                      icon: LineAwesomeIcons.clock_o,
                      title: "Récents",
                      colour: recent_s
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                      hover: recent_s ? Colors.black : Colors.transparent,
                      weight: recent_s ? FontWeight.bold : FontWeight.normal,
                      onPressed: () {
                        setState(
                          () {
                            selected_card_number = 0;
                            recent_s = !recent_s;
                            favoris_s = false;
                            para_s = false;
                            accueil_s = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Recent(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Menuoption(
                      icon: LineAwesomeIcons.file_text,
                      title: "Crédits",
                      colour: para_s
                          ? Color.fromARGB(255, 32, 214, 107)
                          : Colors.white,
                      hover: para_s ? Colors.black : Colors.transparent,
                      weight: para_s ? FontWeight.bold : FontWeight.normal,
                      onPressed: () {
                        setState(
                          () {
                            para_s = !para_s;
                            favoris_s = false;
                            recent_s = false;
                            accueil_s = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Setting(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                      height: 1,
                      color: Colors.white54,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Color.fromARGB(255, 31, 31, 33),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menuoption extends StatelessWidget {
  Menuoption(
      {required this.title,
      required this.icon,
      required this.colour,
      required this.hover,
      required this.weight,
      required this.onPressed});

  String title;
  IconData icon;
  Color colour;
  Color hover;
  FontWeight weight;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 40, top: 3, bottom: 3),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: hover,
      ),
      child: ListTile(
        onTap: () {
          onPressed();
        },
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 7.0),
          child: Icon(
            icon,
            color: colour,
            size: 25,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "orkney",
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}

class CardoUp extends StatefulWidget {
  CardoUp({
    required this.image,
    required this.title,
    required this.description,
    required this.city,
    required this.isLiked,
  });
  final String image;
  final String title;
  final String description;
  final String city;
  bool isLiked;

  @override
  _CardoUpState createState() => _CardoUpState();
}

class _CardoUpState extends State<CardoUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontFamily: "orkney"),
          ),
          Text(
            "Discover Place",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "orkney"),
          )
        ],
      ),
    );
  }
}
