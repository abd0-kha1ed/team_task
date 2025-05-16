import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/task_entity.dart';

abstract class AddNewTaskRepo {
  Future<Either<ServerException, TaskEntity>> addNewTask(TaskEntity taskEntity);
}
