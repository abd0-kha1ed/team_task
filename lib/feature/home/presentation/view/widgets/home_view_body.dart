import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/delete_task_cubit.dart';
import 'package:team_task/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TaskTabBar(
            selectedIndex: selectedTabIndex,
            onTap: (index) => setState(() => selectedTabIndex = index),
          ),
          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TaskSuccess) {
                  final allTasks = state.tasks;

                  // Apply filter
                  final tasksToShow =
                      selectedTabIndex == 1
                          ? allTasks.where((task) => !task.isChecked).toList()
                          : selectedTabIndex == 2
                          ? allTasks.where((task) => task.isChecked).toList()
                          : allTasks;

                  if (tasksToShow.isEmpty) {
                    return const Center(child: Text('No tasks'));
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.separated(
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
                          trailing: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
                            listener: (context, state) {
                              if (state is DeleteTaskError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.error),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (state is DeleteTaskSuccess) {
                                // ✅ إعادة تحميل المهام بعد الحذف
                                context.read<TaskCubit>().getTasks();
                    
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text('Task deleted successfully'),
                                //     backgroundColor: Colors.green,
                                //   ),
                                // );
                              }
                            },
                            builder: (context, state) {
                              return IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  context.read<DeleteTaskCubit>().deleteTask(task.id);
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              task.isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
                              color: task.isChecked ? Colors.green : Colors.grey,
                            ),
                            onPressed: () {
                              context.read<TaskCubit>().updateTaskStatus(
                                id: task.id,
                                isCompleted: !task.isChecked,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    
                        );
                      },
                    ),
                  );
                }

                if (state is TaskError) {
                  return Center(child: Text(state.error));
                }

                return const Center(child: Text('No tasks found.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
