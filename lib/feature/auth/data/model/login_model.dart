import 'package:team_task/feature/auth/domain/entites/login_entity.dart';

class LoginModel extends LoginEntity {
  final String accesstoken;
  final String refreshtoken;

  LoginModel({
    required super.id,
    required super.email,
    required super.password,
    required this.accesstoken,
    required this.refreshtoken,
  });

  // from json
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      accesstoken: json['accesstoken'],
      refreshtoken: json['refreshtoken'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'accesstoken': accesstoken,
      'refreshtoken': refreshtoken,
    };
  }
}
