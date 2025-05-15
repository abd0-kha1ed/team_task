import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:team_task/feature/auth/domain/use_cases/register_case.dart';
import 'package:team_task/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = '/signInView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => RegisterCubit(RegisterUseCase(getIt<AuthRepoImpl>())),
        child: RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration successful!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading ? true : false,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: RegisterViewBody());
      },
    );
  }
}
