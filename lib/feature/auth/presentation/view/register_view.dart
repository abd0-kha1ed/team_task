import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:team_task/feature/auth/domain/use_cases/register_case.dart';
import 'package:team_task/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/widget/register_view_body_bloc_consumer.dart';

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

