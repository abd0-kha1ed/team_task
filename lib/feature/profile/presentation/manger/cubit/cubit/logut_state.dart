part of 'logut_cubit.dart';

@immutable
sealed class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}

class LogoutError extends LogoutState {
  final String error;

  LogoutError({required this.error});
}
