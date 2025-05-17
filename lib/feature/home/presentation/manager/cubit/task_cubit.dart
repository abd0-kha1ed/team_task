import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
}
