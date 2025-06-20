import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'TodoItem.dart';
import 'TodoProvider.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var todo = TodoItem(
                  Uuid().v4(),
                  _titleController.text,
                  _notesController.text,
                  false,
                );
                await TodoProvider.instance.insertTodo(todo);
                Navigator.of(context).pop(); // Close and return
              },
              child: Text("Add Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
