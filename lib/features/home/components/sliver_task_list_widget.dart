import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_item_widget.dart';
import 'package:tasky/features/task_controller.dart';

class SliverTaskListWidget extends StatelessWidget {
  const SliverTaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder:
          (BuildContext context, TaskController controller, Widget? child) {
        final tasksList = controller.allTasks;
        return controller.isLoading
            ? SliverToBoxAdapter(
                child: Center(
                    child: CircularProgressIndicator(
                  value: 20,
                )),
              )
            : controller.allTasks.isEmpty
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'No Data',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.only(bottom: 80),
                    sliver: SliverList.separated(
                      itemCount: tasksList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final allTasks = controller.allTasks;
                        return TaskItemWidget(
                          model: tasksList[index],
                          onChanged: (bool? value) {
                            final taskId = allTasks[index].id;
                            controller.doneTask(value, taskId);
                          },
                          onDelete: (int id) {
                            controller.deleteTask(id);
                          },
                          onEdit: () => controller.loadAllTasks(),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 8);
                      },
                    ),
                  );
      },
    );
  }
}
