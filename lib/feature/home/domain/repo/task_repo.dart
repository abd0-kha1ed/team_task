import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';

abstract class TaskRepo {
  Future<Either<ServerException, List<TaskEntity>>> getTasks();
  Future<Either<ServerException, TaskEntity>> updateTask(TaskEntity taskEntity);
  Future<Either<ServerException, TaskEntity>> deleteTask(TaskEntity taskEntity);
}