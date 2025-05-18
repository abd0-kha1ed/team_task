import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/domain/repo/task_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;

  final _taskStreamController = StreamController<List<TaskEntity>>.broadcast();
  Stream<List<TaskEntity>> get taskStream => _taskStreamController.stream;

  TaskCubit({required this.taskRepo}) : super(TaskInitial()) {
    getTasks(); // تحميل أولي عند التهيئة
  }

  Future<void> getTasks() async {
  print("🔁 getTasks() called");

  emit(TaskLoading());

  var result = await taskRepo.getTasks();
  result.fold(
    (error) {
      print("❌ getTasks failed: $error");
      emit(TaskError(error.toString()));
    },
    (taskEntity) {
      print("✅ getTasks success: ${taskEntity.length} tasks");
      emit(TaskSuccess(taskEntity));
      _taskStreamController.add(taskEntity); // بث للواجهة
    },
  );
}


  @override
  Future<void> close() {
    _taskStreamController.close();
    return super.close();
  }
}
