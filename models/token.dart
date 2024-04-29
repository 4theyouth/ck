class Token {
  String accessToken;
  String refreshToken;
  String expires;

  Token(this.accessToken, this.refreshToken, this.expires);

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(json['access_token'], json['refresh_token'], json['expires']);
  }
}
