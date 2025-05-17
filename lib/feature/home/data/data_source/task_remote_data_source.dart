import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/home/data/model/task_model.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';

class TaskRemoteDataSource {
  final DioConsumer dio;
  TaskRemoteDataSource({required this.dio});
  Future<Either<ServerException, List<TaskEntity>>> getTasks() async {
    try {
      final response = await dio.get(EndPoint.getTasks);
      return Right((response.data as List)
          .map((e) => TaskModel.fromJson(e))
          .toList());
    } on ServerException catch (e) {
      log('ServerException: ${e.errorModel.errorMessage}');
      return Left(e);
    }
  }
  
}
