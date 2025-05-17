part of 'add_new_task_cubit.dart';

@immutable
sealed class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}

class AddNewTaskLoading extends AddNewTaskState {}

class AddNewTaskSuccess extends AddNewTaskState {
  final AddNewTaskEntity taskEntity;
  AddNewTaskSuccess({required this.taskEntity});
}

class AddNewTaskError extends AddNewTaskState {
  final String error;
  AddNewTaskError({required this.error});
}
