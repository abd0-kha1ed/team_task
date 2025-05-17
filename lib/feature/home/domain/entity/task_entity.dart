import 'package:team_task/core/api/end_points.dart';

class TaskEntity {
  final int id;
  final String title;
  final String subtitle;
  final String date;
  final bool isChecked;

  TaskEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isChecked,
  });
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.title: title,
      ApiKey.description: subtitle,
      ApiKey.dueDate: date,
      ApiKey.status: isChecked,
    };
  }
}
