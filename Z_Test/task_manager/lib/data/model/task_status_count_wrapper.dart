import 'package:task_manager/data/model/task_count_model.dart';

class TaskStatusCountWrapper {
  String? status;
  List<TaskCountModel>? taskCountList;

  TaskStatusCountWrapper({this.status, this.taskCountList});

  TaskStatusCountWrapper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountList = <TaskCountModel>[];
      json['data'].forEach((v) {
        taskCountList!.add(new TaskCountModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (taskCountList != null) {
      data['data'] = taskCountList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
