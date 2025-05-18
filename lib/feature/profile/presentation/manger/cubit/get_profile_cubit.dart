// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/domain/repos/auth_repo.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final AuthRepo authRepo;
  GetProfileCubit({required this.authRepo}) : super(GetProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    var result = await authRepo.getUserData();
    result.fold(
      (error) {
        emit(GetProfileError(error: error.toString()));
      },
      (user) {
        emit(GetProfileSuccess(profileModel: user));
      },
    );
  }
}
