import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/domain/repo/task_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;
  TaskCubit({required this.taskRepo}) : super(TaskInitial());
  Future<void> getTasks() async {
    emit(TaskLoading());
    var result = await taskRepo.getTasks();
    result.fold(
      (error) => emit(TaskError(error.toString())),
      (taskEntity) => emit(TaskSuccess(taskEntity)),
    );
  }
}
