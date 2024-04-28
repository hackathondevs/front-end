class Token {
  final String token;

  Token({required this.token});

  Map<String, dynamic> toMap() {
    return {"token": token};
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(token: map['token']);
  }
}
