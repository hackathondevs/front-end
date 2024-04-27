import 'dart:convert';

Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));

String animalToJson(Animal data) => json.encode(data.toJson());

class Animal {
  String name;
  String latin;
  String countryOfOrigin;
  List<String> characteristics;
  String category;
  String lifespan;
  String funfact;
  bool gotBonus;

  Animal({
    required this.name,
    required this.latin,
    required this.countryOfOrigin,
    required this.characteristics,
    required this.category,
    required this.lifespan,
    required this.funfact,
    required this.gotBonus,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        name: json["name"],
        latin: json["latin"],
        countryOfOrigin: json["countryOfOrigin"],
        characteristics:
            List<String>.from(json["characteristics"].map((x) => x)),
        category: json["category"],
        lifespan: json["lifespan"],
        funfact: json["funfact"],
        gotBonus: json["gotBonus"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latin": latin,
        "countryOfOrigin": countryOfOrigin,
        "characteristics": List<dynamic>.from(characteristics.map((x) => x)),
        "category": category,
        "lifespan": lifespan,
        "funfact": funfact,
        "gotBonus": gotBonus,
      };
}
