import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/core/widget/custom_bottom_nav_bar.dart';
import 'package:team_task/feature/add_new_task/presentation/views/add_new_task_view.dart';
import 'package:team_task/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:team_task/feature/profile/presentation/manger/cubit/cubit/logut_cubit.dart';
import 'package:team_task/feature/profile/presentation/manger/cubit/get_profile_cubit.dart';

import 'package:team_task/feature/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  GetProfileCubit(authRepo: getIt.get<AuthRepoImpl>())
                    ..getProfile(),
        ),
        BlocProvider(
          create:
              (context) => LogoutCubit(
                authRepo: getIt.get<AuthRepoImpl>(),
              ), // provide LogoutCubit
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<GetProfileCubit, GetProfileState>(
          builder: (context, state) {
            if (state is GetProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProfileError) {
              return Center(child: Text(state.error));
            } else if (state is GetProfileSuccess) {
              return ProfileViewBody(profileModel: state.profileModel);
            } else {
              return const Center(child: Text('No profile available'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddNewTaskView.routeName);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 4),
      ),
    );
  }
}
