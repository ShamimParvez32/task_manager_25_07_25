import 'task_model.dart';

class CancelledListByStatusModel {
  String? status;
  List<TaskModel>? cancelledTaskList;

  CancelledListByStatusModel({this.status, this.cancelledTaskList});

  CancelledListByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      cancelledTaskList = <TaskModel>[];
      json['data'].forEach((v) {
        cancelledTaskList!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cancelledTaskList != null) {
      data['data'] = cancelledTaskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}