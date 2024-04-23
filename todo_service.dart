import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo_detail_model.dart';
import 'todo_model.dart';

class TodoService {
  Future<List<Todo>> fetchTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      Iterable todosJson = jsonDecode(response.body);
      return todosJson.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoDetail> fetchTodoDetail(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
    if (response.statusCode == 200) {
      return TodoDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load todo detail');
    }
  }
}
