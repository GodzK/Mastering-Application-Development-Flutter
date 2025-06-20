import 'package:flutter/material.dart';
import 'package:flutter_app/add_todo_page.dart';
import 'package:flutter_app/TodoItem.dart';
import 'package:flutter_app/TodoProvider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.libreBaskervilleTextTheme(),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
        useMaterial3: false,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TodoProvider todoProvider = TodoProvider.instance;
  late Future<List<TodoItem>> _todoFuture;

  @override
  void initState() {
    super.initState();
    _todoFuture = _fetchTodos();
  }

  Future<List<TodoItem>> _fetchTodos() async {
    return await todoProvider.fetchTodos();
  }
 void _onCheckValueChange(bool isChecked , TodoItem item) async{
    TodoItem newItem = TodoItem(item.id,item.title,item.notes , isChecked);
    await todoProvider.updateTodo(newItem);
    setState(() {

    });
 }
  void _onFabClicked() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddTodoPage()))
        .then((_) {
      setState(() {
        _todoFuture = _fetchTodos(); // Refresh todo list after adding
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phakaphol Native App')),
      body: FutureBuilder<List<TodoItem>>(
        future: _todoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            var items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var todoItem = items[index];
                // dismissible เอามาครอบเเล้วปัดซ้ายปัดขวาได้
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  background: Container(),
                  // overwrite a background
                  secondaryBackground: Container(color: Colors.blue,),
                  onDismissed: (direction){
                    setState(() {
                      todoProvider.deleteTodo(todoItem);
                    });
                  },
                  child: ListTile(
                    title: Text(todoItem.title),
                    subtitle: Text(todoItem.notes),
                    leading: Checkbox(
                      value: todoItem.done,
                      onChanged: (value) => _onCheckValueChange(value ?? false,todoItem),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data found."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabClicked,
        tooltip: "Add Todo",
        child: Icon(Icons.add),
      ),
    );
  }
}
