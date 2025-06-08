import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/theme/theme_controller.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';
import 'package:tasky/features/add_task/add_task_screen.dart';
import 'package:tasky/features/home/components/achieved_tasks_widget.dart';
import 'package:tasky/features/home/components/high_priority_tasks_widget.dart';
import 'package:tasky/features/home/components/sliver_task_list_widget.dart';
import 'package:tasky/features/task_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController().loadUserData();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Selector<TaskController, String?>(
                        selector: (context, TaskController controller) =>
                            controller.userImagePath,
                        builder: (BuildContext context, String? userImagePath,
                            Widget? child) {
                          return CircleAvatar(
                            backgroundImage: userImagePath == null
                                ? AssetImage('assets/images/person.png')
                                    as ImageProvider
                                : FileImage(File(userImagePath)),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Selector<TaskController, String?>(
                              selector: (context, TaskController controller) =>
                                  controller.username,
                              builder: (BuildContext context, String? username,
                                  Widget? child) {
                                return Text(
                                  "Good Evening, $username",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                );
                              },
                            ),
                            Selector<TaskController, String?>(
                              selector: (context, TaskController controller) =>
                                  controller.motivationQuote,
                              builder: (BuildContext context,
                                  String? motivationQuote, Widget? child) {
                                return Text(
                                  motivationQuote ?? '',
                                  style: Theme.of(context).textTheme.titleSmall,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      ValueListenableBuilder<ThemeMode>(
                        valueListenable: ThemeController.themeNotifier,
                        builder: (context, mode, _) {
                          return ElevatedButton(
                            onPressed: () {
                              ThemeController.toggleTheme();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                              iconColor: Theme.of(context).iconTheme.color,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: CustomSvgPicture(
                              path: ThemeController.isDark()
                                  ? "assets/images/light_icon.svg"
                                  : "assets/images/dark_icon.svg",
                              height: 18,
                              width: 18,
                              withColorFilter: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Yuhuu, Your work Is',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        'almost done! ',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      CustomSvgPicture.withoutColor(
                          width: 32,
                          height: 32,
                          path: 'assets/images/waving_hand.svg'),
                    ],
                  ),
                  SizedBox(height: 16),
                  AchievedTasksWidget(),
                  SizedBox(height: 8),
                  HighPriorityTasksWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: Text(
                      'My Tasks',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            SliverTaskListWidget(),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 44,
        child: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton.extended(
              onPressed: () async {
                final bool? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AddTaskScreen();
                    },
                  ),
                );

                if (result != null && result) {
                  context.read<TaskController>().loadAllTasks();
                }
              },
              label: Text(
                'Add New Task',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Color(0xFFFFFCFC),
                    ),
              ),
              icon: Icon(
                Icons.add,
                size: 18,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            );
          },
        ),
      ),
    );
  }
}
