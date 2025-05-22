import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/core/widget/custom_bottom_nav_bar.dart';
import 'package:team_task/feature/add_new_task/presentation/views/add_new_task_view.dart';
import 'package:team_task/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:team_task/feature/home/data/repo/task_repo_impl.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/delete_task_cubit.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:team_task/feature/home/presentation/view/widgets/home_view_body_bloc-consumer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskCubit>.value(
          value: getIt<TaskCubit>(), // ✅ استخدم نفس instance المسجل في main
        ),
        BlocProvider(
          create:
              (context) =>
                  DeleteTaskCubit(taskRepo: getIt<TaskRepoImpl>()), // ✅ استخدم
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello Ahmed 👋', style: TextStyle(color: Colors.black)),
              Text(
                'Today is Monday, April 28',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          actions: const [
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width: 16),
          ],
        ),
        body: const HomeViewBodyBlocConsumer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final isAdded = await Navigator.pushNamed(
              context,
              AddNewTaskView.routeName,
            );
            if (isAdded == true) {
              context.read<TaskCubit>().getTasks(); // ✅ سيعمل بعد ربط صحيح
            }
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      ),
    );
  }
}
