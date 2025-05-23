import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/widget/modal_progress_widget.dart';
import 'package:team_task/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:team_task/feature/auth/presentation/view/widget/register_view_body.dart';

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
        return ModalProgressWidget(
          isLoading: state is RegisterLoading ? true : false,
          child: RegisterViewBody(),
        );
      },
    );
  }
}
