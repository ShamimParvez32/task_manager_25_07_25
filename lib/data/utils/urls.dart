class Urls{
  static const String _baseUrl ='https://task.teamrabbil.com/api/v1';
  static const String registrationUrl= '$_baseUrl/registration';
  static const String logInUrl= '$_baseUrl/login';
  static const String createTaskUrl= '$_baseUrl/createTask';
  static const String taskStatusCountUrl= '$_baseUrl/taskStatusCount';
  static const String updateProfileUrl= '$_baseUrl/profileUpdate';
  static String taskListByStatusUrl(String status) => '$_baseUrl/listTaskByStatus/$status';
  static String progressTaskListUrl(String status) => '$_baseUrl/listTaskByStatus/$status';
  static String completedTaskListUrl(String status) => '$_baseUrl/listTaskByStatus/$status';
  static String cancelledTaskListUrl(String status) => '$_baseUrl/listTaskByStatus/$status';
  static  String deleteTaskUrl(String id) => '$_baseUrl/deleteTask/$id';
  static String updateTaskStatusUrl(String taskId, String status) =>
      '$_baseUrl/updateTaskStatus/$taskId/$status';

}
