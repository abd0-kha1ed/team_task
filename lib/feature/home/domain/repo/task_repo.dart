import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';

abstract class TaskRepo {
  Future<Either<ServerException, List<TaskEntity>>> getTasks();
  Future<Either<ServerException, TaskEntity>> updateTask(TaskEntity taskEntity);
  Future<Either<ServerException, TaskEntity>> deleteTask(TaskEntity taskEntity);
<<<<<<< HEAD
  Future<Either<ServerException, TaskEntity>> updateTaskStatus({
  required int id,
  required bool isCompleted,
});

}
=======
}
>>>>>>> f05667b2006f23b5f48328643ad7ce2605d2ddf3
