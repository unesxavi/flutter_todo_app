import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  final taskController = TextEditingController();

  List allTasks = [
    Task(title: "Publish video", status: false),
    Task(title: "GEM", status: true),
    Task(title: "Play soccer", status: false),
    Task(title: "Eat", status: false),
    Task(title: "Swimming", status: false),
    Task(title: "Call mom", status: true),
  ];

  addtaskFunction() {
    setState(() {
      if (taskController.text.isNotEmpty) {
        allTasks.add(Task(title: taskController.text, status: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          title: Text(
            "To Do App".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: double.infinity,
                    padding: const EdgeInsets.all(22),
                    color: Colors.amber[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: taskController,
                          maxLength: 22,
                          decoration: InputDecoration(
                            labelText: 'Add new task',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                taskController.clear();
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            addtaskFunction();
                            taskController.clear();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Add new task',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                isScrollControlled: true);
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...allTasks.map((item) =>
                      TodoCard(taskTitle: item.title, taskStatus: item.status)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
