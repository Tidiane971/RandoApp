import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'styles.dart';
import 'data.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

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
                        "TurtleRando",
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
          /////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////
          ////////////////////////BODY/////////////////////////////////
          //////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////
          body: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 260,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 30, left: 16, right: 1),
                                    child: Text(
                                      "Découvrez les plus Belles Randonnées de Guadeloupe, Photos, Itiniéraire, Préparation, vous aurez toutes les informations nécessaire pour choisir et préparer VOTRE randonée de rêve.",
                                      style: categories,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0, left: 3),
                                      child: Text(
                                        "Populaires",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    title: Icon(
                                      LineAwesomeIcons.long_arrow_right,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Swiper(
                              layout: SwiperLayout.TINDER,
                              itemWidth: 250,
                              itemHeight: 300,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return current_cardesup[index];
                              },
                              onIndexChanged: (int index) {
                                setState(
                                  () {
                                    selected_card_number = index;
                                  },
                                );
                              },
                              itemCount: current_cardesup.length,
                              viewportFraction: 0.85,
                              scale: 0.9,
                              onTap: (int index) {
                                addToRecent(index);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Page1(
                                      card: current_cardes[index],
                                      title: current_cardesup[index].title,
                                      image: current_cardesup[index].image,
                                      city: current_cardesup[index].city,
                                      description:
                                          current_cardesup[index].description,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////
                /////////////////////////DEUXIEME SCREEN ////////////////////
                ///////////////////////////////////////////////////////////
                /////////////////////////////////////////////////////////////////
                Container(
                  height: 700,
                  child: Column(
                    children: [
                      Categories_List(
                        changeCate: () {
                          setState(
                            () {
                              selected_card_number = 0;
                              selected_categories["Tout"]
                                  ? current_cardes = tout
                                  : null;
                              selected_categories["Rivière"]
                                  ? current_cardes = riviere_cardes
                                  : null;
                              selected_categories["Plage"]
                                  ? current_cardes = plage_cardes
                                  : null;
                              selected_categories["Montagne"]
                                  ? current_cardes = montagne_cardes
                                  : null;
                              selected_categories["Forêt"]
                                  ? current_cardes = foret_cardes
                                  : null;
                              affichlocal.clear();
                              for (Cardo item in current_cardes) {
                                if (item.city == chosen_location) {
                                  affichlocal.add(item);
                                }
                              }
                            },
                          );
                        },
                      ),
                      Expanded(
                          flex: 5,
                          child: howMany(chosen_location) != 0 ||
                                  chosen_location == "Tout"
                              ? Swiper(
                                  loop: false,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (chosen_location != "Tout") {
                                      return affichlocal[index];
                                    } else {
                                      return current_cardes[index];
                                    }
                                  },
                                  onIndexChanged: (int index) {
                                    setState(
                                      () {
                                        selected_card_number = index;
                                      },
                                    );
                                  },
                                  itemCount: chosen_location != "Tout"
                                      ? affichlocal.length
                                      : current_cardes.length,
                                  viewportFraction: 0.85,
                                  scale: 0.9,
                                  onTap: (int index) {
                                    addToRecent(index);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Page1(
                                          card: current_cardes[index],
                                          title: current_cardes[index].title,
                                          image: current_cardes[index].image,
                                          city: current_cardes[index].city,
                                          description:
                                              current_cardes[index].description,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Container()),
                      FootBar(
                        location: chosen_location,
                        deviceWidth: deviceWidth,
                        index: selected_card_number,
                        text: howMany(chosen_location).toString(),
                        firsttext: howMany(chosen_location) == 0
                            ? "0"
                            : (selected_card_number + 1).toString(),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 15),
                          height: 20,
                          width: deviceWidth,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildCityChoser(name: "Tout"),
                              buildCityChoser(name: "Abymes"),
                              buildCityChoser(name: "Anse-Bertrand"),
                              buildCityChoser(name: "Baie-Mahault"),
                              buildCityChoser(name: "Baillif"),
                              buildCityChoser(name: "Basse-Terre"),
                              buildCityChoser(name: "Bouillante"),
                              buildCityChoser(name: "Capesterre"),
                              buildCityChoser(name: "Deshaies"),
                              buildCityChoser(name: "Gosier"),
                              buildCityChoser(name: "Goyave"),
                              buildCityChoser(name: "Lamentin"),
                              buildCityChoser(name: "Morne-à-L'eau"),
                              buildCityChoser(name: "Moule"),
                              buildCityChoser(name: "Petit-bourg"),
                              buildCityChoser(name: "Petit-Canal"),
                              buildCityChoser(name: "Pointe-à-Pitre"),
                              buildCityChoser(name: "Pointe-Noire"),
                              buildCityChoser(name: "Port-Louis"),
                              buildCityChoser(name: "St-Claude"),
                              buildCityChoser(name: "St-François"),
                              buildCityChoser(name: "St-Anne"),
                              buildCityChoser(name: "St-Rose"),
                              buildCityChoser(name: "Trois-Rivières"),
                              buildCityChoser(name: "Vieux-Fort"),
                              buildCityChoser(name: "Vieux-Habitants"),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  CityChoser buildCityChoser({required String name}) {
    return CityChoser(
      name: name,
      colour: Colors.white70,
      fonction: () {
        setState(
          () {
            chosen_location = name;
            selected_card_number = 0;
            selected_categories["Rivière"]
                ? current_cardes = riviere_cardes
                : null;
            selected_categories["Plage"] ? current_cardes = plage_cardes : null;
            selected_categories["Montagne"]
                ? current_cardes = montagne_cardes
                : null;
            selected_categories["Forêt"] ? current_cardes = foret_cardes : null;
            affichlocal.clear();
            for (Cardo item in current_cardes) {
              if (item.city == chosen_location) {
                affichlocal.add(item);
              }
            }
          },
        );
      },
    );
  }
}
