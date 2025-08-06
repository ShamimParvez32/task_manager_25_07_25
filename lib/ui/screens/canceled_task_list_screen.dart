import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/data/models/cancelled_task_list_model.dart';
import 'package:task_manager_25_07_25/data/services/network_caller.dart';
import 'package:task_manager_25_07_25/data/utils/urls.dart';
import 'package:task_manager_25_07_25/ui/widgets/center_circular_progress_indecator.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/showSnackBarMessage.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_item_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';
class CanceledTaskListScreen extends StatefulWidget {
  const CanceledTaskListScreen({super.key});

  @override
  State<CanceledTaskListScreen> createState() => _CanceledTaskListScreenState();
}

class _CanceledTaskListScreenState extends State<CanceledTaskListScreen> {
  bool _cancelledListInProgress = false;
  CancelledListByStatusModel? cancelledTaskListModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCancelledTaskList();
  }


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _cancelledListInProgress == false,
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
      itemCount: cancelledTaskListModel?.cancelledTaskList?.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          taskModel: cancelledTaskListModel!.cancelledTaskList![index],
          onDeleteTap: () {  },);
      },
    );

  }

  Future<void> _getCancelledTaskList() async {
    _cancelledListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.cancelledTaskListUrl('Cancelled'),
    );
    if (response.isSuccess) {
      cancelledTaskListModel = CancelledListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
    _cancelledListInProgress = false;
    setState(() {});
  }

}


