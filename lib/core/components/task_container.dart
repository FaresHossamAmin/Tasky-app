import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/models/task_model.dart';

class TaskContainer extends StatefulWidget {
  const TaskContainer({super.key});

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  String? tasksString;
  List<TaskModel> tasksModel = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    tasksString = prefs.getString('tasks');

    if (tasksString != null && tasksString!.isNotEmpty) {
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
    return Expanded(
      child: ListView.builder(
        itemCount: tasksModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(40, 40, 40, 1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 19),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // tasksModel[index].isDone
                      true
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset("assets/images/checked.svg"),
                                SvgPicture.asset("assets/images/checkmark.svg"),
                              ],
                            )
                          : SvgPicture.asset("assets/images/unchecked.svg"),
                    ],
                  ),
                  SizedBox(width: 19),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasksModel[index].name,
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(fontFamily: "Poppins"),
                              ),
                              if (tasksModel[index].description.isNotEmpty)
                                Text(
                                  tasksModel[index].description,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                      ),
                                ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/images/triple-dot.svg",
                          width: 2,
                          height: 16,
                          colorFilter: ColorFilter.mode(
                            Color.fromRGBO(160, 160, 160, 1),
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 19),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
