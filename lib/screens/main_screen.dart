import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';
import 'package:moslem_pocket/screens/home_screen.dart';
import 'package:moslem_pocket/screens/progress_screen.dart';
import 'package:moslem_pocket/screens/profile_screen.dart';
import 'package:moslem_pocket/screens/schedule_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ScheduleScreen(),
    const ProgressScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Schedule"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Progress"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
          ],
        ),
      ),
    );
  }
}
