// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String email;
  String profilePicture;
  String name;
  int balance;

  User({
    required this.email,
    required this.profilePicture,
    required this.name,
    required this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        profilePicture: json["profilePicture"],
        name: json["name"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "profilePicture": profilePicture,
        "name": name,
        "balance": balance,
      };
}
