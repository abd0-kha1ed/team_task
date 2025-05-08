import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/domain/use_cases/register_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.signInUseCase) : super(RegisterInitial());
  final RegisterUseCase signInUseCase;
  Future<void> signIn({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoading());
    final result = await signInUseCase(
      RegisterParam(email: email, password: password, name: name),
    );
    result.fold(
      (error) => emit(RegisterFailure(errorMessage: error.toString())),
      (signInEntity) => emit(RegisterSuccess(signInEntity: signInEntity)),
    );
  }
}
