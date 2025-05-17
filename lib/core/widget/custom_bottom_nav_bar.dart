import 'package:flutter/material.dart';
import 'package:team_task/feature/add_new_task/presentation/views/add_new_task_view.dart';
import 'package:team_task/feature/profile/presentation/view/profile_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _navigateTo(int index, BuildContext context) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/home', (route) => false);
        break;
      case 1:
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/calendar', (route) => false);
        break;
      case 2:
        Navigator.pushNamed(context, AddNewTaskView.routeName);
        break;
      case 3:
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/search', (route) => false);
        break;
      case 4:
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(ProfileView.routeName, (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = ['Home', 'Calendar', '', 'Search', 'Profile'];
    final icons = [
      Icons.home,
      Icons.calendar_today,
      Icons.add,
      Icons.search,
      Icons.person,
    ];

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            if (index == 2) return const SizedBox(width: 48); // FAB gap
            return GestureDetector(
              onTap: () => _navigateTo(index, context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    color:
                        currentIndex == index
                            ? Colors.blue
                            : Colors.grey.shade400,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          currentIndex == index
                              ? Colors.blue
                              : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
