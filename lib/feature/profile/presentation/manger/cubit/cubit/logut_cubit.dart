import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/auth/domain/repos/auth_repo.dart';

part 'logut_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepo authRepo;
  LogoutCubit({required this.authRepo}) : super(LogoutInitial());
  Future<void> logut() async {
    emit(LogoutLoading());
    var result = await authRepo.logout();
    result.fold(
      (error) {
        emit(LogoutError(error: error.toString()));
      },
      (message) {
        emit(LogoutSuccess(message: message));
      },
    );
  }
}
