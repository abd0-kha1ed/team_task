import 'package:team_task/core/api/end_points.dart';

class TaskEntity {
  final int id;
  final String title;
  final String description;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
  });
  toJson() {
    return {
      ApiKey.id: id,
      ApiKey.title: title,
      ApiKey.description: description,
    };
  }
}
