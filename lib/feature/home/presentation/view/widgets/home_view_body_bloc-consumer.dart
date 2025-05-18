import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:team_task/feature/home/presentation/view/widgets/home_view_body.dart';

class HomeViewBodyBlocConsumer extends StatelessWidget {
  const HomeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskError) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state is TaskSuccess) {
          return HomeViewBody(tasks: state.tasks);
        } else {
          return const Center(child: Text('No tasks available'));
        }
      },
    );
  }
}
