import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/add_new_task_entity.dart';

class AddNewTaskModel extends AddNewTaskEntity {
  AddNewTaskModel({
    required super.title,
    required super.description,
    required super.dueData,
  });

  factory AddNewTaskModel.fromJson(Map<String, dynamic> json) {
    return AddNewTaskModel(
      title: json[ApiKey.title],
      description: json[ApiKey.description],
      dueData: json[ApiKey.dueDate] ?? DateTime.now().toString(),
    );
  }
}
