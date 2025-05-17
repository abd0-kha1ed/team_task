import 'package:team_task/feature/home/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.time,
    required super.status,
    required super.isChecked,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      time: json['time'],
      status: json['status'],
      isChecked: json['isChecked'] ?? false,
    );
  }
}
