import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import './Todo.dart';
import "dart:convert";

final ToDoProvider = FutureProvider<List<Todo>>((ref) {
  const url = "https://jsonplaceholder.typicode.com/todos";
  return http.get(Uri.parse(url)).then((response) {
    print(response.statusCode);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      print(parsed.map<Todo>((json) => Todo.fromJson(json)).toList());

      return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  });
});
