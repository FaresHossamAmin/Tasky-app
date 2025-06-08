import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_list_widget.dart';
import 'package:tasky/features/task_controller.dart';

class CompleteTasksScreen extends StatelessWidget {
  const CompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, controller, child) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final todoTasks = controller.completedTasks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Completed Tasks',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TaskListWidget(
                  tasks: todoTasks,
                  emptyMessage: 'No Task Found',
                  onTap: (value, index) {
                    final taskId = todoTasks[index!].id;
                    controller.doneTask(value, taskId);
                  },
                  onDelete: (int? id) {
                    controller.deleteTask(id);
                  },
                  onEdit: () {
                    controller.loadAllTasks();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
