import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_list_widget.dart';
import 'package:tasky/features/task_controller.dart';

class HighPriorityScreen extends StatelessWidget {
  const HighPriorityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'High Priority Tasks',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<TaskController>(
            builder: (context, controller, child) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final highPriorityTasks = controller.highPriorityTasks;

              return TaskListWidget(
                tasks: highPriorityTasks,
                emptyMessage: 'No Task Found',
                onTap: (value, index) {
                  final taskId = highPriorityTasks[index!].id;
                  controller.doneTask(value, taskId);
                },
                onDelete: (int? id) {
                  controller.deleteTask(id);
                },
                onEdit: () {
                  controller.loadAllTasks();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
