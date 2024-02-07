class TokenQR {
  final String token;

  TokenQR({
    required this.token,
  });

  factory TokenQR.fromJson(Map<String, dynamic> json) {
    final token = json['token'];
    return TokenQR(
      token: token,
    );
  }
}
