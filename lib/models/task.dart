class Task {
  final int? id;
  final String task;
  bool completion;

  Task({this.id, required this.task, this.completion = false});

// Convert JSON response to a Dart object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      task: json['task'],
      completion: json['completion'],
    );
  }
// Convert Dart object to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id
      'task': task,
      'completion': completion,
    };
  }
}
