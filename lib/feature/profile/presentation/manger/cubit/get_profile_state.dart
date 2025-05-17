part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final RegisterEntity profileModel;

  GetProfileSuccess({required this.profileModel});
}

class GetProfileError extends GetProfileState {
  final String error;

  GetProfileError({required this.error});
}

class LogoutLoading extends GetProfileState {}

class LogoutSuccess extends GetProfileState {
  final String message;

  LogoutSuccess({required this.message});
}

class LogoutError extends GetProfileState {
  final String error;

  LogoutError({required this.error});
}
