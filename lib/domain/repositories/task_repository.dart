abstract class TaskRepository {
  Future<Map<String, dynamic>> applyProposal(
      Map<String, dynamic> data, String id);
  Future<Map<String, dynamic>> createTask(Map<String, dynamic> data);
  Future<Map<String, dynamic>> getTaskList();
}
