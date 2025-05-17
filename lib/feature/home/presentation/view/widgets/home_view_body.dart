import 'package:flutter/material.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_app_bar.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_highlight_card.dart';
import 'package:team_task/feature/home/presentation/view/widgets/task_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> allTasks = const [
    {
      'title': 'Task 5 Meeting',
      'subtitle': 'Jakxy mobile app meeting',
      'time': '09:00 pm',
      'status': 'completed',
      'statusColor': Colors.green,
    },
    {
      'title': 'Task 5 Meeting',
      'subtitle': 'Jakxy mobile app meeting',
      'time': '09:00 pm',
      'status': 'pending',
      'statusColor': Colors.amber,
    },
    {
      'title': 'Task 5 Meeting',
      'subtitle': 'Jakxy mobile app meeting',
      'time': '09:00 pm',
      'status': 'canceled',
      'statusColor': Colors.red,
    },
    {
      'title': 'Task 5 Meeting',
      'subtitle': 'Jakxy mobile app meeting',
      'time': '09:00 pm',
      'status': 'canceled',
      'statusColor': Colors.red,
    },
  ];

  List<Map<String, dynamic>> getFilteredTasks() {
    if (selectedTabIndex == 1) {
      return allTasks.where((task) => task['status'] == 'pending').toList();
    } else if (selectedTabIndex == 2) {
      return allTasks.where((task) => task['status'] == 'completed').toList();
    } else if (selectedTabIndex == 3) {
      return allTasks.where((task) => task['status'] == 'canceled').toList();
    } else {
      return allTasks;
    }
  }

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
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              transitionBuilder:
                  (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
              child: TaskList(
                key: ValueKey<int>(selectedTabIndex),
                tasks: getFilteredTasks(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
