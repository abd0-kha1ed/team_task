import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/home/data/data_source/task_remote_data_source.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/domain/repo/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepoImpl({required this.taskRemoteDataSource});
  @override
  Future<Either<ServerException, TaskEntity>> deleteTask(int id) async {
    try {
      var result = await taskRemoteDataSource.deleteTask(id);
      return result;
    } on ServerException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerException, List<TaskEntity>>> getTasks() async {
    return await taskRemoteDataSource.getTasks();
  }

  @override
  Future<Either<ServerException, TaskEntity>> updateTask(
    TaskEntity taskEntity,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerException, TaskEntity>> updateTaskStatus({
    required int id,
    required bool isCompleted,
  }) {
    return taskRemoteDataSource.updateTaskStatus(
      id: id,
      isCompleted: isCompleted,
    );
  }
}
