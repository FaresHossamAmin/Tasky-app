import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/features/home/home_screen.dart';
import 'package:tasky/features/profile/profile_screen.dart';
import 'package:tasky/features/tasks/complete_tasks_screen.dart';
import 'package:tasky/features/tasks/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screen = [
    const HomeScreen(),
    const ToDoScreen(),
    const CompleteTasksScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _currentIndex,
        onTap: (int? index) {
          setState(() {
            _currentIndex = index ?? 0;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/home.svg', 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/todo.svg', 1),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/todo_complete.svg', 2),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgPicture('assets/images/profile_icon.svg', 3),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(child: _screen[_currentIndex]),
    );
  }

  SvgPicture _buildSvgPicture(String path, int index) => SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          _currentIndex == index
                ? const Color(0xFF0F9D58) 
            : const Color(0xFF6E6E6E), 
          BlendMode.srcIn,
        ),
      );
}
