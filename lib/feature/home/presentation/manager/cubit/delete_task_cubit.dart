import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/domain/repo/task_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  final TaskRepo taskRepo;
  DeleteTaskCubit({required this.taskRepo}) : super(DeleteTaskInitial());
  Future<void> deleteTask(int id) async {
  emit(DeleteTaskLoading());

  var result = await taskRepo.deleteTask(id);

  result.fold(
    (l) => emit(DeleteTaskError(l.errorModel.errorMessage)),
    (r) async {
      emit(DeleteTaskSuccess(r));
      await Future.delayed(const Duration(milliseconds: 300));
      emit(DeleteTaskInitial());
    },
  );
}

}
