import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_item_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/task_status_summary_counter_widget.dart';
import 'package:task_manager_25_07_25/ui/widgets/tm_appBar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
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
                child: _buildTaskListView(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, AddNewTaskScreen.name);
      },child: Icon(Icons.add),),
    );
  }

  ListView _buildTaskListView() {
    return ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return TaskItemWidget(color: Colors.teal,);
                },
              );
  }

  Widget _buildTasksSummaryByStatus() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            TaskStatusSummaryCounterWidget(title: 'New task', count: '10'),
            TaskStatusSummaryCounterWidget(title: 'Progress', count: '10'),
            TaskStatusSummaryCounterWidget(title: 'Completed', count: '10'),
            TaskStatusSummaryCounterWidget(title: 'Canceled', count: '10'),
          ],
        ),
      ),
    );
  }
}


