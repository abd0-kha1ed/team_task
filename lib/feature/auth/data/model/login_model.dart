import 'package:team_task/feature/auth/domain/entites/login_entity.dart';

class LoginModel extends LoginEntity {
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required super.id,
    required super.email,
    required super.password,
    required this.accessToken,
    required this.refreshToken,
  });

  // from json
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
