part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<TaskEntity> tasks;
  TaskSuccess(this.tasks);
}

final class TaskError extends TaskState {
  final String error;
  TaskError(this.error);
}

final class TaskUnauthicated extends TaskState {}
