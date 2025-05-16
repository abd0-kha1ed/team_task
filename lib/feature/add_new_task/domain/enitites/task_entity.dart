import 'package:team_task/core/api/end_points.dart';

class TaskEntity {
  final String title;
  final String description;
  final String dueData;

  TaskEntity({
    required this.title,
    required this.description,
    required this.dueData,
  });
  toJson() {
    return {
      ApiKey.dueDate: dueData,
      ApiKey.title: title,
      ApiKey.description: description,
    };
  }
}
