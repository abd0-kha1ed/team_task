import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.date,
    required super.isChecked,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
  return TaskModel(
    id: json[ApiKey.id] ?? 0,
    title: json[ApiKey.title] ?? '',
    subtitle: json[ApiKey.description] ?? '',
    date: json[ApiKey.dueDate] ??
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
    isChecked: json[ApiKey.isCompleted].toString() == "1",
  );
}

}
