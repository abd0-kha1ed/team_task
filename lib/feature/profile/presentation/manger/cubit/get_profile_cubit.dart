import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';
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

  Future<void> logout() async {
    emit(LogoutLoading());
    var result = await authRepo.logout();
    await result.fold(
      (error) async {
        emit(LogoutError(error: error.toString()));
      },
      (message) async {
        // حذف التوكن محليًا بعد نجاح logout من الـ API
        await CacheHelper.removeData(
          key: ApiKey.token,
        ); // تأكدي إن المفتاح 'token' صحيح
        emit(LogoutSuccess(message: message));
      },
    );
  }
}
