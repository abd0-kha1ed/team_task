import 'package:flutter/material.dart';
import 'package:team_task/feature/add_new_task/presentation/views/widgets/add_new_task_view_body.dart';

class AddNewTaskView extends StatelessWidget {
  static const routeName = '/add-new-task';
  const AddNewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Add New Task'),
        centerTitle: true,
        elevation: 0,
      ),

      body: AddNewTaskViewBody(),
    );
  }
}
