import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/app.dart';
import 'package:task_manager_25_07_25/data/models/task_model.dart';
import 'package:task_manager_25_07_25/data/services/network_caller.dart';
import 'package:task_manager_25_07_25/data/utils/urls.dart';
import 'package:task_manager_25_07_25/ui/widgets/showSnackBarMessage.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskModel, required this.onDeleteTap, this.onStatusUpdate,
  });

  final TaskModel taskModel;
  final VoidCallback onDeleteTap;
  final VoidCallback? onStatusUpdate;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text(taskModel.createdDate ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _getStatusColor(taskModel.status?? 'New'),
                  ),
                  child: Text(
                      taskModel.status?? 'New',
                      style: TextStyle(color: Colors.white)),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      onDeleteTap();
                    }, icon: Icon(Icons.delete)),

                    IconButton(onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Change Status'),
                              content: Column(
                                children: [
                                  ListTile(title: Text('New'),
                                    onTap: () => _updateStatus('New')
                                  ),
                                  Divider(),
                                  ListTile(title: Text('inProgress'),
                                      onTap: () => _updateStatus('inProgress')
                                  ),
                                  Divider(),
                                  ListTile(title: Text('Completed'),
                                      onTap: () => _updateStatus('Completed')
                                  ),
                                  Divider(),
                                  ListTile(title: Text('Cancelled'),
                                      onTap: () => _updateStatus('Cancelled')
                                  ),
                                ],
                              ),
                            );
                          },
                        );

                        }, icon: Icon(Icons.edit)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _updateStatus(String newStatus) async {
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.updateTaskStatusUrl(taskModel.sId!, newStatus),
    );

    if (response.isSuccess) {
      onStatusUpdate?.call();
      showSnackBarMessage(TaskManagerApp.navigatorKey.currentContext!, 'Status updated to $newStatus');
      Navigator.pop(TaskManagerApp.navigatorKey.currentContext!);
    } else {
      showSnackBarMessage(TaskManagerApp.navigatorKey.currentContext!,  response.errorMessage ?? 'Update failed');
    }
  }



  Color _getStatusColor(String status) {
    if (status == 'New') {
      return Colors.blue;
    } else if (status == 'Progress') {
      return Colors.yellow;
    } else if (status == 'Cancelled') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

}
