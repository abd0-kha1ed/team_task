import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/add_new_task_entity.dart';
import 'package:team_task/feature/add_new_task/domain/repo/add_new_task_repo.dart';

part 'add_new_task_state.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  final AddNewTaskRepo addNewTaskRepo;
  AddNewTaskCubit({required this.addNewTaskRepo}) : super(AddNewTaskInitial());

  Future<void> addNewTask(AddNewTaskEntity taskEntity) async {
    emit(AddNewTaskLoading());
    var result = await addNewTaskRepo.addNewTask(taskEntity);
    result.fold(
      (error) => emit(AddNewTaskError(error: error.toString())),
      (taskEntity) => emit(AddNewTaskSuccess(taskEntity: taskEntity)),
    );
  }
}
