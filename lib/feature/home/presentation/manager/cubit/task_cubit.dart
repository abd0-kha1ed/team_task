import 'dart:async';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:dio/dio.dart'; // for DioException
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/domain/repo/task_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;

  final _taskStreamController = StreamController<List<TaskEntity>>.broadcast();
  Stream<List<TaskEntity>> get taskStream => _taskStreamController.stream;

  TaskCubit({required this.taskRepo}) : super(TaskInitial()) {
    getTasks(); // initial load on init
  }

  Future<void> getTasks() async {
    print("🔁 getTasks() called");

    // Check for stored token before API call
    final token = CacheHelper.getDataString(key: ApiKey.token);
    if (token == null) {
      print("🚨 No token found, user needs to login");
      emit(TaskUnauthicated());
      return;
    }

    emit(TaskLoading());

    var result = await taskRepo.getTasks(); // Pass token to repo
    result.fold(
      (error) {
        emit(TaskError(error.errorModel.errorMessage));
      },
      (taskEntity) {
        emit(TaskSuccess(taskEntity));
        _taskStreamController.add(taskEntity);
      },
    );
  }

  @override
  Future<void> close() {
    _taskStreamController.close();
    return super.close();
  }
}
