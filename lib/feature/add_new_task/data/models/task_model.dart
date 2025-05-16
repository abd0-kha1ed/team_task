import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.title,
    required super.description,
    required super.dueData,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json[ApiKey.title],
      description: json[ApiKey.description],
      dueData: json[ApiKey.dueDate] ?? DateTime.now().toString(),
    );
  }
}
