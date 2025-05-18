part of 'delete_task_cubit.dart';

@immutable
sealed class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {
  final TaskEntity taskEntity;
  DeleteTaskSuccess(this.taskEntity);
}

class DeleteTaskError extends DeleteTaskState {
  final String error;
  DeleteTaskError(this.error);
}
