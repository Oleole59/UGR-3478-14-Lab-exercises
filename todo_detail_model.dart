// todo_detail_model.dart
class TodoDetail {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoDetail({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoDetail.fromJson(Map<String, dynamic> json) {
    return TodoDetail(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
