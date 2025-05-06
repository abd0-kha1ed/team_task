import 'package:team_task/core/api/end_points.dart';

class ErrorModel {
  final int statusCode;
  final String errorMessage;

  ErrorModel({required this.statusCode, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}
