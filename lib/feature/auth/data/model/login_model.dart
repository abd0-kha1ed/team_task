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

  factory LoginModel.fromJson(Map<String, dynamic> json) {
  final data = json['data'] ?? json;

  return LoginModel(
    id: int.tryParse(data['id'].toString()) ?? 0, // Ensures safe int conversion
    email: data['email'] ?? '',
    password: '', // never trust backend to return password
    accessToken: data['access_token'] ?? '',
    refreshToken: data['refresh_token'] ?? '',
  );
}


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      // Do not serialize password unless absolutely needed
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
