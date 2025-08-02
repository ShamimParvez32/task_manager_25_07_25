import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_item_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';
class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
     );
  }

  ListView _buildTaskListView() {
    return ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return TaskItemWidget(color: Colors.purple,);
                },
    );
  }


}


