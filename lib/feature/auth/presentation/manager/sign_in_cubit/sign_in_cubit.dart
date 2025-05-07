import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/domain/use_cases/register_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInUseCase) : super(SignInInitial());
  final SignInCase signInUseCase;
  Future<void> signIn({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignInLoading());
    final result = await signInUseCase(
      SignInParams(
        email: email,
        password: password,
        name: name,
      ),
    );
    result.fold(
      (error) => emit(SignInFailure(errorMessage: error.toString())),
      (signInEntity) => emit(SignInSuccess(signInEntity: signInEntity)),
    );
  }
}
