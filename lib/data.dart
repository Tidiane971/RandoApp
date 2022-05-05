import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:ui';
import 'widgets.dart';

List<Cardo> tout = [
  Cardo(
    image: 'images/carbet.jpeg',
    title: "Carbet",
    description:
        "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, ",
    city: "Capesterre",
    isLiked: false,
  ),
  Cardo(
    image: 'images/ecrevisse.jpg',
    title: "Ecrevisse",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Mamelles",
    isLiked: false,
  ),
  Cardo(
    image: 'images/acomat.jpg',
    title: "Acomat",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Pointe-Noire",
    isLiked: false,
  ),
  Cardo(
    image: 'images/souffleur.JPG',
    title: "Soufleur",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Port-Louis",
    isLiked: false,
  ),
  Cardo(
    image: 'images/grandanse.jpeg',
    title: "Grand Anse",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Deshaies",
    isLiked: false,
  ),
  Cardo(
    image: 'images/soufriere.jpg',
    title: "Soufrière",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "St-Claude",
    isLiked: false,
  ),
  Cardo(
    image: 'images/foret.jpg',
    title: "Parc National",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Mamelles",
    isLiked: false,
  ),
];

List<Cardo> riviere_cardes = [
  Cardo(
    image: 'images/carbet.jpeg',
    title: "Carbet",
    description:
        "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, ",
    city: "Capesterre",
    isLiked: false,
  ),
  Cardo(
    image: 'images/ecrevisse.jpg',
    title: "Ecrevisse",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Mamelles",
    isLiked: false,
  ),
  Cardo(
    image: 'images/acomat.jpg',
    title: "Acomat",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Pointe-Noire",
    isLiked: false,
  ),
];

List<Cardo> plage_cardes = [
  Cardo(
    image: 'images/souffleur.JPG',
    title: "Soufleur",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Port-Louis",
    isLiked: false,
  ),
  Cardo(
    image: 'images/grandanse.jpeg',
    title: "Grand Anse",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Deshaies",
    isLiked: false,
  ),
];
List<Cardo> montagne_cardes = [
  Cardo(
    image: 'images/soufriere.jpg',
    title: "Soufrière",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "St-Claude",
    isLiked: false,
  ),
];
List<Cardo> foret_cardes = [
  Cardo(
    image: 'images/foret.jpg',
    title: "Parc National",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Mamelles",
    isLiked: false,
  ),
];

int selected_card_number = 0;

Map selected_categories = {
  "Tout": true,
  "Rivière": false,
  "Plage": false,
  "Montagne": false,
  "Forêt": false,
};

bool riviere_s = false;
bool plage_s = false;
bool montagne_s = false;
bool foret_s = false;
bool tout_s = true;

Color iconColor = Colors.white;
List<Cardo> current_cardes = tout;

Color hover_color = Colors.green;

bool accueil_s = false;
bool favoris_s = false;
bool recent_s = false;
bool para_s = false;

List<CardoUp> current_cardesup = riviere_cardesup;

List<CardoUp> riviere_cardesup = [
  CardoUp(
      isLiked: false,
      image: 'images/souffleur.JPG',
      title: "Souffleur",
      description:
          "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, ",
      city: "Capesterre"),
  CardoUp(
      isLiked: false,
      image: 'images/ecrevisse.jpg',
      title: "Ecrevisse",
      description:
          "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
      city: "Mamelles"),
  CardoUp(
    image: 'images/acomat.jpg',
    title: "Acomat",
    description:
        "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans",
    city: "Pointe-Noire",
    isLiked: false,
  ),
];
int number_item = 0;
String chosen_location = "Tout";

int howMany(String location) {
  if (chosen_location == "Tout") {
    return current_cardes.length;
  }
  number_item = 0;

  for (Cardo item in current_cardes) {
    if (item.city == chosen_location) {
      number_item++;
    }
  }

  return number_item;
}

int itemNumber = 0;

class CityChoser extends StatefulWidget {
  CityChoser(
      {required this.name, required this.colour, required this.fonction});

  String name;
  Color colour;
  bool isSelected = false;
  Function fonction;

  @override
  _CityChoserState createState() => _CityChoserState();
}

class _CityChoserState extends State<CityChoser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: InkWell(
          child: Text(
            widget.name,
            style: TextStyle(color: widget.colour),
          ),
          onTap: () {
            widget.fonction();
          }),
    );
  }
}

List<Cardo> affichlocal = [];

List<Cardo> favCardes = [];
List<Cardo> recentCardes = [];

void addToRecent(int index) {
  if (recentCardes.contains(current_cardes[index]) == false) {
    if (recentCardes.length <= 9) {
      recentCardes.insert(0, current_cardes[index]);
    } else {
      recentCardes.removeAt(9);
      recentCardes.insert(0, current_cardes[index]);
    }
  }
}
