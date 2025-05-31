import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/completed_screen.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/profile_screen.dart';
import 'package:tasky/to_do_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // list of 4 screens
  List<Widget> screens = [
    HomeScreen(),
    ToDoScreen(),
    CompletedScreen(),
    ProfileScreen(),
  ];

  int _currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (int? index) {
          if (index != null) {
            setState(() {
              _currentScreenIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/home.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _currentScreenIndex == 0
                        ? Theme.of(
                            context,
                          ).bottomNavigationBarTheme.selectedItemColor!
                        : Theme.of(
                            context,
                          ).bottomNavigationBarTheme.unselectedItemColor!,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/todo.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _currentScreenIndex == 1
                        ? Theme.of(
                            context,
                          ).bottomNavigationBarTheme.selectedItemColor!
                        : Theme.of(
                            context,
                          ).bottomNavigationBarTheme.unselectedItemColor!,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/completed.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _currentScreenIndex == 2
                        ? Theme.of(
                            context,
                          ).bottomNavigationBarTheme.selectedItemColor!
                        : Theme.of(
                            context,
                          ).bottomNavigationBarTheme.unselectedItemColor!,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/profile.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _currentScreenIndex == 3
                        ? Theme.of(
                            context,
                          ).bottomNavigationBarTheme.selectedItemColor!
                        : Theme.of(
                            context,
                          ).bottomNavigationBarTheme.unselectedItemColor!,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            label: "Profile",
          ),
        ],
      ),

      body: screens[_currentScreenIndex],
    );
  }
}
