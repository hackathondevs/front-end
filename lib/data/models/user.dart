class User {
  final String token;

  User({required this.token});

  Map<String, dynamic> toMap() {
    return {"token": token};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(token: map['token']);
  }
}
