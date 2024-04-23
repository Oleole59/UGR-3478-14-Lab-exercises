import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        home: TodoListScreen(),
      ),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    todoProvider.fetchTodos(); // Fetch todos on screen load

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, index) {
          final todo = todoProvider.todos[index];
          return ListTile(
            title: Text(todo.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailScreen(todoId: todo.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final int todoId;

  const TodoDetailScreen({Key? key, required this.todoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    todoProvider.fetchTodoDetail(todoId); // Fetch todo detail on screen load

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          final todoDetail = provider.currentTodoDetail;
          if (todoDetail == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title: ${todoDetail.title}'),
                  Text('Completed: ${todoDetail.completed}'),
                  // Add more details as needed
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
