import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _navigateTo(int index, BuildContext context) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;

      case 1:
        // FAB-like action (e.g., open modal or special route)
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
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
