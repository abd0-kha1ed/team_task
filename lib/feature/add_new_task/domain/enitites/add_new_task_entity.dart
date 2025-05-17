import 'package:team_task/core/api/end_points.dart';

class AddNewTaskEntity {
  final String title;
  final String description;
  final String dueData;

  AddNewTaskEntity({
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
