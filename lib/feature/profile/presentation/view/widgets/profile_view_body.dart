import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/widget/custom_button.dart';

import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/presentation/view/login_view.dart';
import 'package:team_task/feature/profile/presentation/manger/cubit/cubit/logut_cubit.dart';
// <-- import LogoutCubit

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.profileModel});
  final RegisterEntity profileModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Center(
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 200, 195, 195),
              radius: 70,
              child: Icon(Icons.person, size: 60, color: Colors.black),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            profileModel.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            profileModel.email,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const Spacer(),

          // Use BlocConsumer for LogoutCubit instead of GetProfileCubit
          BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              } else if (state is LogoutSuccess) {
                Future.microtask(() {
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                    debugPrint('Logout Success - Navigated to LoginView');
                  }
                });
              }
            },
            builder: (context, state) {
              if (state is LogoutLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButton(
                color: Colors.red,
                text: 'Logout',
                onPressed: () {
                  context
                      .read<LogoutCubit>()
                      .logut(); // <-- call logout on LogoutCubit
                },
              );
            },
          ),

          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
