class SignResponse {
  dynamic user;
  dynamic token;

  SignResponse(this.user, this.token);

  factory SignResponse.fromJson(Map<String, dynamic> json) {
    return SignResponse(json['user'] as dynamic, json['token'] as dynamic);
  }
}
