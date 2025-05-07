import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/auth/domain/entites/login_entity.dart';
import 'package:team_task/feature/auth/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUseCase(LoginParam(email: email, password: password));
    result.fold(
      (error) => emit(LoginFailure(errorMessage: error.toString())),
      (loginEntity) => emit(LoginSuccess(loginEntity: loginEntity)),
    );
  }
}
