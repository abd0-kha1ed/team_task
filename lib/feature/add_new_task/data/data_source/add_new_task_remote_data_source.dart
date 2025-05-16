import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/add_new_task/data/models/task_model.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/task_entity.dart';

class AddNewTaskRemoteDataSource {
  final DioConsumer dio;

  AddNewTaskRemoteDataSource({required this.dio});

  Future<Either<ServerException, TaskEntity>> addNewTask(
    TaskEntity taskEntity,
  ) async {
    try {
      final response = await dio.post(
        EndPoint.createTask,
        queryParameters: taskEntity.toJson(),
      );
      return Right(TaskModel.fromJson(response.data));
    } on ServerException catch (e) {
      log('ServerException: ${e.errorModel.errorMessage}');
      return Left(e);
    }
  }
}
