// To parse this JSON data, do
//
//     final animal = animalFromJson(jsonString);

import 'dart:convert';

Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));

String animalToJson(Animal data) => json.encode(data.toJson());

class Animal {
  int id;
  String picture;
  String name;
  String latin;
  String origin;
  String characteristic;
  String diet;
  String lifespan;
  String funfact;
  double lat;
  double long;

  Animal({
    required this.id,
    required this.picture,
    required this.name,
    required this.latin,
    required this.origin,
    required this.characteristic,
    required this.diet,
    required this.lifespan,
    required this.funfact,
    required this.lat,
    required this.long,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      picture: json['picture'],
      name: json['name'],
      latin: json['latin'],
      origin: json['origin'],
      characteristic: json['characteristic'],
      diet: json['diet'],
      lifespan: json['lifespan'],
      funfact: json['funfact'],
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "name": name,
        "latin": latin,
        "origin": origin,
        "characteristic": characteristic,
        "diet": diet,
        "lifespan": lifespan,
        "funfact": funfact,
        "lat": lat,
        "long": long,
      };
}

List<Animal> animalList = [];
