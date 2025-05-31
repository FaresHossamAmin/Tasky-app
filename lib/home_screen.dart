import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/add_task_screen.dart';
import 'package:tasky/core/components/task_container.dart';
import 'package:tasky/core/models/task_model.dart';
import 'package:tasky/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  String? tasksString;
  List<TaskModel> tasksModel = [];

  @override
  void initState() {
    super.initState();
    loadUsername();
    loadTasks();
  }

  void loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedUsername = prefs.getString('username');
    if (!loadedUsername.isNullOrEmpty) {
      setState(() {
        username = loadedUsername;
      });
    }
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    tasksString = prefs.getString('tasks');

    if (!tasksString.isNullOrEmpty) {
      final taskDecoded = jsonDecode(tasksString!) as List<dynamic>;
      setState(() {
        tasksModel = taskDecoded
            .map((task) => TaskModel.fromMap(task))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 24.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 167,
            height: 40,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
              backgroundColor: Theme.of(
                context,
              ).floatingActionButtonTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              label: Text(
                "Add New Task",
                style: Theme.of(
                  context,
                ).floatingActionButtonTheme.extendedTextStyle,
              ),
              icon: Icon(
                Icons.add,
                size: 18,
                color: Theme.of(
                  context,
                ).floatingActionButtonTheme.extendedTextStyle?.color,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/happy-svgrepo-com.svg",
                  width: 42,
                  height: 42,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Evening, $username",
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontFamily: "Poppins"),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "One task at a time. One step\ncloser.",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        color: const Color.fromRGBO(198, 198, 198, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Yuhuu, Your work Is",
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "almost done !",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontSize: 32),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  "assets/images/waving-hand.svg",
                  width: 42,
                  height: 42,
                ),
              ],
            ),
            SizedBox(height:50),
            Text(
              "My Tasks",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 20,
                fontFamily: "Poppins",
              ),
            ),
            TaskContainer(),
            SizedBox(height: 94),
          ],
        ),
      ),
    );
  }
}
