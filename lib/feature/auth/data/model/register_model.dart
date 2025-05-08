import 'package:team_task/feature/auth/domain/entites/register_entity.dart';

class RegisterModel extends RegisterEntity {
  final String id;
  final String accessToken;
  final String refreshToken;
  RegisterModel(
    this.id,
    this.accessToken,
    this.refreshToken, {
    required super.name,
    required super.email,
    required super.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      json['id'] as String,
      json['access_token'] as String,
      json['refresh_token'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
