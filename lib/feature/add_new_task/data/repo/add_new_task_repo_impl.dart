import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/add_new_task/data/data_source/add_new_task_remote_data_source.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/add_new_task_entity.dart';
import 'package:team_task/feature/add_new_task/domain/repo/add_new_task_repo.dart';

class AddNewTaskRepoImpl implements AddNewTaskRepo {
  final AddNewTaskRemoteDataSource addNewTaskRemoteDataSource;

  AddNewTaskRepoImpl({required this.addNewTaskRemoteDataSource});
  @override
  Future<Either<ServerException, AddNewTaskEntity>> addNewTask(
    AddNewTaskEntity taskEntity,
  ) async {
    var result = await addNewTaskRemoteDataSource.addNewTask(taskEntity);
    return result;
  }
}
