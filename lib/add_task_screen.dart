import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/components/custom_text_form_field.dart';
import 'package:tasky/core/models/task_model.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/main.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isHighPriority = true;
  final GlobalKey<FormState> taskNameDescriptionKey = GlobalKey<FormState>();

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print("build");
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),

          child: Form(
            key: taskNameDescriptionKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/image-Thumbnail.svg"),
                    SizedBox(width: 4),
                    Text(
                      "New Task",
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge!.copyWith(fontFamily: "Poppins"),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        title: "Task Name",
                        hintText: "Finish UI design for login screen",
                        controller: taskNameController,

                        validator: (value) {
                          if (value.isNullOrEmpty) {
                            return "Please Enter Task Name";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20),
                      CustomTextFormField(
                        title: "Task Description",
                        hintText:
                            "Finish onboarding UI and hand off to devs by Thursday",
                        maxLines: 7,
                        controller: taskDescriptionController,
                      ),

                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "High Priority",
                            style: TextTheme.of(context).labelSmall?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            value: isHighPriority,
                            onChanged: (bool value) {
                              setState(() {
                                isHighPriority = value;
                              });
                            },
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          // Check if the text form fields are valid before proceeding
                          if (taskNameDescriptionKey.currentState?.validate() ??
                              false) {
                            // get shared preferences instance
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();

                            // get stored 'tasks' string from shared preferences
                            final String? list = sharedPreferences.getString(
                              'tasks',
                            );

                            // Initialize an empty task list (to hold decoded tasks)
                            // its List<Map<String, dynamic>>
                            List<dynamic> taskList = [];

                            // If 'list' is not null or empty, decode the JSON string into a List<dynamic>
                            // Note: your original logic had a mistake; you want to decode if list is NOT null or empty
                            if (!list.isNullOrEmpty) {
                              taskList = jsonDecode(list!);
                            }

                            // Create a new TaskModel instance with the form data
                            TaskModel taskModel = TaskModel(
                              id: taskList.length + 1,
                              name: taskNameController.text,
                              description: taskDescriptionController.text,
                              isHighPriority: isHighPriority,
                            );

                            // Convert the TaskModel to a Map<String, dynamic> and add it to the task list
                            taskList.add(taskModel.toMap());

                            // Encode the updated task list back into a JSON string
                            String tasksToString = jsonEncode(taskList);

                            // Save the updated tasks string into shared preferences
                            await sharedPreferences.setString(
                              "tasks",
                              tasksToString,
                            );

                            // (Optional) Clean up by removing 'tasks' key if the stored string is empty
                            if (sharedPreferences.getString('tasks')?.isEmpty ??
                                true) {
                              sharedPreferences.remove('tasks');
                            }

                            // Retrieve the tasks string again to confirm and decode it
                            String? tasks = sharedPreferences.getString(
                              'tasks',
                            );

                            taskNameController.clear();
                            taskDescriptionController.clear();

                            // Print the list of tasks if it exists and is not empty; else print no tasks found
                            if (tasks != null && tasks.isNotEmpty) {
                              List<dynamic> value = jsonDecode(tasks);
                              print(
                                "Tasks: $value",
                              ); // This will show the full updated task list
                            } else {
                              print("No tasks found");
                            }
                            Navigator.pop(context);
                          }
                        },
                        label: Text(
                          "Add Task",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
