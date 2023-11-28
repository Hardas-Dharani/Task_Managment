import 'dart:convert';

import 'package:task_management/data/providers/network/apis/task_api.dart';

import '../../domain/repositories/task_repository.dart';

class TaskRepositoryIml extends TaskRepository {
  @override
  Future<Map<String, dynamic>> applyProposal(
      Map<String, dynamic> data, String id) async {
    try {
      final response = await TaskAPI.uploadTask(data, id).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createTask(Map<String, dynamic> data) async {
    try {
      final response = await TaskAPI.createTask(data).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getTaskList() async {
    try {
      final response = await TaskAPI.getListTask().request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
