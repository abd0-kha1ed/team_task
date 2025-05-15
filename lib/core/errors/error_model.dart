import 'package:team_task/core/api/end_points.dart';

class ErrorModel {
  final int statusCode;
  final String errorMessage;

  ErrorModel({required this.statusCode, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    String finalMessage = jsonData[ApiKey.errorMessage] ?? jsonData['message'] ?? 'Unknown error';

    // Laravel-style validation
    if (jsonData['errors'] != null && jsonData['errors'] is Map) {
      final errors = jsonData['errors'] as Map<String, dynamic>;
      if (errors.isNotEmpty) {
        final firstKey = errors.keys.first;
        final errorList = errors[firstKey];
        if (errorList is List && errorList.isNotEmpty) {
          finalMessage = errorList.first;
        }
      }
    }

    return ErrorModel(
      statusCode: jsonData[ApiKey.status] ?? 422,
      errorMessage: finalMessage,
    );
  }

  @override
  String toString() => 'ErrorModel($statusCode): $errorMessage';
}
