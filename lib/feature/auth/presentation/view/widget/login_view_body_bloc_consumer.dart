import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/widget/modal_progress_widget.dart';
import 'package:team_task/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/widget/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccess) {
          // Navigator.pushReplacementNamed(context, '/home');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressWidget(
          isLoading: state is LoginLoading ? true : false,

          child: LoginViewBody(),
        );
      },
    );
  }
}
