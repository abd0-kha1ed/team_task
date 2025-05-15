import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:team_task/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:team_task/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/widget/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/loginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginUseCase(getIt<AuthRepoImpl>())),
        child: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
