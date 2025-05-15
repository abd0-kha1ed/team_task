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
    final data = json['data'] ?? json;

    return RegisterModel(
      data['id']?.toString() ?? '',
      data['access_token'] ?? '',
      data['refresh_token'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      password: '', // Password should not come from API
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'name': name,
      'email': email,
      // Optional: don't send password back in `toJson` unless needed
    };
  }
}
