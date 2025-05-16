import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.description,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json[ApiKey.id],
      title: json[ApiKey.title],
      description: json[ApiKey.description],
    );
  }
  toJson() {
    return {
      ApiKey.id: id,
      ApiKey.title: title,
      ApiKey.description: description,
    };
  }
}
