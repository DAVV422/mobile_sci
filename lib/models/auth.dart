import 'package:emergyai/models/user.dart';

class Auth {
    String token;
    User user;

  Auth(
    {
      required this.token,
      required this.user,
    }
  );

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      token: json['accessToken'],
      user: User.fromJson(json['User'])
    );
  }
}