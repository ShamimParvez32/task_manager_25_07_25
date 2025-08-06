import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/data/models/completed_task_list_model.dart';
import 'package:task_manager_25_07_25/data/services/network_caller.dart';
import 'package:task_manager_25_07_25/data/utils/urls.dart';
import 'package:task_manager_25_07_25/ui/widgets/center_circular_progress_indecator.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/showSnackBarMessage.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_item_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';
class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() => _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {
  bool _completedListInProgress = false;
  CompletedListByStatusModel? completedTaskListModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCompletedTaskList();
  }


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _completedListInProgress == false,
      replacement: const CenterCircularProgressIndicator(),
      child: Scaffold(
        appBar: TMAppbar(),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildTaskListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildTaskListView() {
    return ListView.builder(
      itemCount: completedTaskListModel?.completedTaskList?.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          taskModel: completedTaskListModel!.completedTaskList![index],
          onDeleteTap: () {  },);
      },
    );

  }

  Future<void> _getCompletedTaskList() async {
    _completedListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.completedTaskListUrl('Completed'),
    );
    if (response.isSuccess) {
      completedTaskListModel = CompletedListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _completedListInProgress = false;
    setState(() {});
  }
}


