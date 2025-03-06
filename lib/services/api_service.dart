import 'dart:convert';

import 'package:taskmanager/models/task.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080';

  // Fetch All tasks
  static Future<List<Task>> getTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception("Failed to load tasks");
    }
  }

  // Add a task
  static Future<void> addTask(Task newTask) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(newTask.toJson()),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      // Success: Task added
      return;
    } else {
      throw Exception("Failed to add task: ${response.body}");
    }
  }

  // Delete a task
  static Future<void> deleteTask(int id) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/tasks/$id')); // Fixed URL

    if (response.statusCode != 200) {
      throw Exception("Failed to delete task");
    }
  }
}
