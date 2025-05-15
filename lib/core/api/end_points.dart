class EndPoint {
  static String baseUrl = "https://api.5dmaty.com/public/";

  // Authentication
  static String login = "api/login?";
  static String register = "api/register";
  static String logout = "api/logout?";
  static String profile = "api/profile?";
  static String updateProfile = "api/update-profile?"; // If used

  // Task
  static String getTasks = "api/tasks";
  static String createTask = "api/tasks";
  static String updateTask(int id) => "api/tasks/$id";
  static String deleteTask(int id) => "api/tasks/$id";
  static String changeTaskStatus(int id) => "api/tasks/$id/status";
}


class ApiKey {
  static String status = "status";
  static String errorMessage = "message";

  // Auth
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String name = "name";

  // Tasks
  static String title = "title";
  static String description = "description";
  static String dueDate = "dueDate";
  static String isCompleted = "isCompleted";
  static String userId = "user_id";

  // Misc
  static String id = "id";
}
