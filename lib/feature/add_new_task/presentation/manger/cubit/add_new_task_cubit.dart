import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/add_new_task/domain/enitites/task_entity.dart';

part 'add_new_task_state.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  AddNewTaskCubit() : super(AddNewTaskInitial());
}
