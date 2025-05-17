import 'package:flutter/material.dart';
import 'package:team_task/feature/home/data/model/task_model.dart';
import 'package:team_task/feature/home/domain/entity/task_entity.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.tasks});
  final List<TaskEntity> tasks;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedTabIndex = 0;
  late List<TaskEntity> filteredTasks;

  @override
  void initState() {
    super.initState();
    filteredTasks = widget.tasks;
  }

  void filterTasks() {
    setState(() {
      if (selectedTabIndex == 1) {
        filteredTasks = widget.tasks.where((task) => !task.isChecked).toList();
      } else if (selectedTabIndex == 2) {
        filteredTasks = widget.tasks.where((task) => task.isChecked).toList();
      } else {
        filteredTasks = widget.tasks;
      }
    });
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      final task = filteredTasks[index];
      filteredTasks[index] = TaskModel(
        id: task.id,
        title: task.title,
        subtitle: task.subtitle,
        date: task.date,
        isChecked: !task.isChecked,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TaskTabBar(
            selectedIndex: selectedTabIndex,
            onTap: (index) {
              selectedTabIndex = index;
              filterTasks();
            },
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: ListView.separated(
                key: ValueKey<int>(selectedTabIndex),
                itemCount: filteredTasks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final task = filteredTasks[index];
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
                      onPressed: () => toggleTaskCompletion(index),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
