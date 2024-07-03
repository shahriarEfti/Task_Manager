class Urls {
 static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

 // Auth endpoints
 static const String registration = '$_baseUrl/registration';
 static const String login = '$_baseUrl/login';

 // Task management endpoints
 static const String createTask = '$_baseUrl/createTask';
 static const String newTasks = '$_baseUrl/listTaskByStatus/New';
 static const String completedTasks = '$_baseUrl/listTaskByStatus/Completed';
 static const String taskStatusCount = '$_baseUrl/taskStatusCount';
 static const String recoverVerifyEmail = '$_baseUrl/RecoverVerifyEmail';
 static const String recoverVerifyOTP = '$_baseUrl/RecoverVerifyOTP';
 static const String recoverResetPass = '$_baseUrl/RecoverResetPass';

 // Task by status endpoints
 static const String newTask = '$_baseUrl/listTaskByStatus/New';
 static const String completeTask = '$_baseUrl/listTaskByStatus/Completed';
 static const String progressTask = '$_baseUrl/listTaskByStatus/Progress';
 static const String canceledTask = '$_baseUrl/listTaskByStatus/Canceled';

 // Profile endpoints
 static const String updateProfile = '$_baseUrl/profileUpdate';

 // Dynamic URL methods
 static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';
}
