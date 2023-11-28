import 'package:task_management/data/models/login_model.dart';

class TaskListModel {
  List<TaskListModelData>? data;

  TaskListModel({this.data});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TaskListModelData>[];
      json['data'].forEach((v) {
        data!.add(TaskListModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskListModelData {
  int? id;
  String? title;
  String? budget;
  String? startDate;
  String? endDate;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? userId;
  List<void>? projectCover;
  List<void>? projectFile;
  UserModel? user;

  TaskListModelData(
      {this.id,
      this.title,
      this.budget,
      this.startDate,
      this.endDate,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.projectCover,
      this.projectFile,
      this.user});

  TaskListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    budget = json['budget'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    // if (json['project_cover'] != null) {
    //   projectCover = <Null>[];
    //   json['project_cover'].forEach((v) {
    //     projectCover!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['project_file'] != null) {
    //   projectFile = <Null>[];
    //   json['project_file'].forEach((v) {
    //     projectFile!.add(new Null.fromJson(v));
    //   });
    // }
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['budget'] = budget;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    // if (this.projectCover != null) {
    //   data['project_cover'] =
    //       this.projectCover!.map((v) => v.toJson()).toList();
    // }
    // if (this.projectFile != null) {
    //   data['project_file'] = this.projectFile!.map((v) => v.toJson()).toList();
    // }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
