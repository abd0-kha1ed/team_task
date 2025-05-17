import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/core/widget/custom_bottom_nav_bar.dart';
import 'package:team_task/feature/add_new_task/presentation/views/add_new_task_view.dart';
import 'package:team_task/feature/home/data/repo/task_repo_impl.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:team_task/feature/home/presentation/view/widgets/home_view_body_bloc-consumer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = TaskCubit(taskRepo: getIt.get<TaskRepoImpl>());
        cubit.getTasks();
        return cubit;
      },

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
        body: HomeViewBodyBlocConsumer(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddNewTaskView.routeName);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      ),
    );
  }
}
