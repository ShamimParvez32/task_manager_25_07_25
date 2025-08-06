import 'task_model.dart';

class ProgressListByStatusModel {
  String? status;
  List<TaskModel>? progressTaskList;

  ProgressListByStatusModel({this.status, this.progressTaskList});

  ProgressListByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      progressTaskList = <TaskModel>[];
      json['data'].forEach((v) {
        progressTaskList!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (progressTaskList != null) {
      data['data'] = progressTaskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}