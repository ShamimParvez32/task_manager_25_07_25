import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/data/models/progress_task_list_model.dart';
import 'package:task_manager_25_07_25/data/services/network_caller.dart';
import 'package:task_manager_25_07_25/data/utils/urls.dart';
import 'package:task_manager_25_07_25/ui/widgets/center_circular_progress_indecator.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/showSnackBarMessage.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_item_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';
class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
 bool _progressListInProgress = false;
 ProgressListByStatusModel? progressTaskListModel;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProgressTaskList();
  }


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _progressListInProgress == false,
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
                itemCount: progressTaskListModel?.progressTaskList?.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return TaskItemWidget(
                    taskModel: progressTaskListModel!.progressTaskList![index],
                    onStatusUpdate: () => _getProgressTaskList(),
                    onDeleteTap: () {  },);
                },
    );

  }

 Future<void> _getProgressTaskList() async {
   _progressListInProgress = true;
   setState(() {});
   final NetworkResponse response = await NetworkCaller.getRequest(
     url: Urls.taskListByStatusUrl('inProgress'),
   );
   if (response.isSuccess) {
     progressTaskListModel = ProgressListByStatusModel.fromJson(response.responseData!);
   } else {
     showSnackBarMessage(context, response.errorMessage);
   }
   _progressListInProgress = false;
   setState(() {});
 }

}


