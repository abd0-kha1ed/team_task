import 'package:flutter/material.dart';
import 'package:team_task/core/widget/custom_bottom_nav_bar.dart';

class CalendarView extends StatelessWidget {
  static const routeName = '/calendar';

  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Calendar Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
