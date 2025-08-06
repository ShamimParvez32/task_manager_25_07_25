import 'task_model.dart';

class CompletedListByStatusModel {
  String? status;
  List<TaskModel>? completedTaskList;

  CompletedListByStatusModel({this.status, this.completedTaskList});

  CompletedListByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      completedTaskList = <TaskModel>[];
      json['data'].forEach((v) {
        completedTaskList!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (completedTaskList != null) {
      data['data'] = completedTaskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}