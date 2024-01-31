class SignUpResponse {
  String? message;
  String? accessToken;

  SignUpResponse({this.message, this.accessToken});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['accessToken'] = accessToken;
    return data;
  }
}
