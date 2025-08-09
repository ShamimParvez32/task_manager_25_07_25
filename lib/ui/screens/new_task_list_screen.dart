import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/data/models/task_count_by_status_model.dart';
import 'package:task_manager_25_07_25/data/models/task_count_model.dart';
import 'package:task_manager_25_07_25/data/models/task_list_by_status_model.dart';
import 'package:task_manager_25_07_25/data/services/network_caller.dart';
import 'package:task_manager_25_07_25/data/utils/urls.dart';
import 'package:task_manager_25_07_25/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_25_07_25/ui/widgets/center_circular_progress_indecator.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/showSnackBarMessage.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_item_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_status_summary_counter_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';



class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getTaskCountByStatusInProgress = false;
  bool _getNewTaskListInProgress = false;
  TaskCountByStatusModel? taskCoundByStatusModel;
  TaskListByStatusModel? newTaskListModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTaskCountByStatus();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppbar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTasksSummaryByStatus(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Visibility(
                  visible: _getNewTaskListInProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: _buildTaskListView(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewTaskScreen.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _buildTaskListView() {
    return ListView.builder(
      itemCount: newTaskListModel?.taskList?.length ?? 0,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          taskModel: newTaskListModel!.taskList![index],
          onDeleteTap: () => _deleteTask(newTaskListModel!.taskList![index].sId!),
          onStatusUpdate: () => _getNewTaskList(),
        );
      },
    );
  }

  Widget _buildTasksSummaryByStatus() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Visibility(
        visible: _getTaskCountByStatusInProgress == false,
        replacement: const CenterCircularProgressIndicator(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SizedBox(
            height: 100,
            width:double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: taskCoundByStatusModel?.taskByStatusList?.length,
              itemBuilder: (context, index) {
                final TaskCountModel model =
                    taskCoundByStatusModel!.taskByStatusList![index];
                return TaskStatusSummaryCounterWidget(
                  title: model.sId ?? '',
                  count: model.sum.toString(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountByStatusInProgress = true;
    setState(() {});

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.taskStatusCountUrl,
    );
    if (response.isSuccess) {
      taskCoundByStatusModel = TaskCountByStatusModel.fromJson(
        response.responseData!,
      );
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _getTaskCountByStatusInProgress = false;
    setState(() {});
  }

  Future<void> _getNewTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.taskListByStatusUrl('New'),
    );
    if (response.isSuccess) {
      newTaskListModel = TaskListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }

  Future<void>_deleteTask(String id)async{
    NetworkResponse response =await NetworkCaller.getRequest(url: Urls.deleteTaskUrl(id));
    if(response.isSuccess){
      setState(() {
        newTaskListModel!.taskList!.removeWhere((task)=> task.sId == id);
      });
      showSnackBarMessage(context, 'Task deleted successfully');
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }

  }

}
