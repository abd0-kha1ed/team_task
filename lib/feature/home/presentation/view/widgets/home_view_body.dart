import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/feature/home/data/model/task_model.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.tasks});
  final List<TaskEntity> tasks;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedTabIndex = 0;

  List<TaskEntity> _filteredTasks() {
    if (selectedTabIndex == 1) {
      return widget.tasks.where((task) => !task.isChecked).toList();
    } else if (selectedTabIndex == 2) {
      return widget.tasks.where((task) => task.isChecked).toList();
    }
    return widget.tasks;
  }

  void toggleTaskCompletion(TaskEntity task) {
    // هذا مجرد تعديل محلي، لكن في الحالة الحقيقية:
    // أرسل updateTask إلى Cubit أو API
    final updatedTask = TaskModel(
      id: task.id,
      title: task.title,
      subtitle: task.subtitle,
      date: task.date,
      isChecked: !task.isChecked,
    );

    // TODO: send updatedTask to Cubit later
    // context.read<TaskCubit>().updateTask(updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    final tasksToShow = _filteredTasks();

    return Scaffold(
      body: Column(
        children: [
          TaskTabBar(
            selectedIndex: selectedTabIndex,
            onTap: (index) => setState(() => selectedTabIndex = index),
          ),
          Expanded(
            child: tasksToShow.isEmpty
                ? const Center(child: Text('No tasks'))
                : ListView.separated(
                    key: ValueKey<int>(selectedTabIndex),
                    itemCount: tasksToShow.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final task = tasksToShow[index];
                      return ListTile(
                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          task.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (task.subtitle.isNotEmpty) Text(task.subtitle),
                            Text(
                              "Date: ${task.date}",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            task.isChecked
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: task.isChecked ? Colors.green : Colors.grey,
                          ),
                          onPressed: () => toggleTaskCompletion(task),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
