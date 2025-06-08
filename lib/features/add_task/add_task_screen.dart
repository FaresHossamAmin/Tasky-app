import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';
import 'package:tasky/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController taskNameController = TextEditingController();

  final TextEditingController taskDescriptionController =
      TextEditingController();

  bool isHighPriority = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, 
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'New Task',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    controller: taskNameController,
                    title: "Task Name",
                    hintText: 'Finish UI design for login screen',
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter Task Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    title: "Task Description",
                    controller: taskDescriptionController,
                    maxLines: 5,
                    hintText:
                        'Finish onboarding UI and hand off to devs by Thursday.',
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'High Priority',
                        style: Theme.of(context).textTheme.titleMedium,
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
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                    ),
                    onPressed: _onAddTask,
                    label: Text('Add Task'),
                    icon: Icon(Icons.add),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onAddTask() async {
    if (_key.currentState?.validate() ?? false) {
      final taskJson = PreferencesManager().getString(StorageKey.tasks);
      List<dynamic> listTasks = [];

      if (taskJson != null) {
        listTasks = jsonDecode(taskJson);
      }

      TaskModel model = TaskModel(
        id: listTasks.length + 1,
        taskName: taskNameController.text,
        taskDescription: taskDescriptionController.text,
        isHighPriority: isHighPriority,
      );

      listTasks.add(model.toJson());
      final taskEncode = jsonEncode(listTasks);

      await PreferencesManager().setString(StorageKey.tasks, taskEncode);

      Navigator.of(context).pop(true);
    }
  }
}
