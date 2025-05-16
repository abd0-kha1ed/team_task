import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/core/functions/service_locator.dart';
import 'package:team_task/feature/add_new_task/data/repo/add_new_task_repo_impl.dart';
import 'package:team_task/feature/add_new_task/domain/repo/add_new_task_repo.dart';
import 'package:team_task/feature/add_new_task/presentation/manger/cubit/add_new_task_cubit.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/add_new_task_view_body.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/add_new_task_view_body_bloc_consumer.dart';

class AddNewTaskView extends StatelessWidget {
  static const routeName = '/add-new-task';
  const AddNewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              AddNewTaskCubit(addNewTaskRepo: getIt<AddNewTaskRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: const Text('Add New Task'),
          centerTitle: true,
          elevation: 0,
        ),

        body: AddNewTaskViewBodyBlocConsumer(),
      ),
    );
  }
}
